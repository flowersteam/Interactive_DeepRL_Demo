/* GLOBAL VARIABLES */

window.erasing_radius = 15;
window.asset_size = 8;

// Lists of points {x, y} composing the terrain shapes
window.ground = [];
window.ceiling = [];

// Lists of raw points {x, y} drawn by the user for the terrain shapes
window.terrain = {
    ground: [],
    ceiling: []
};

// Parameters to handle the alignment of the terrain to the startpad according to the situation
window.align_terrain = {
    align: true,
    ceiling_offset: null,
    ground_offset: null,
    smoothing: null
};

/* INIT FUNCTIONS */

/**
 * Initializes the game.
 * @param cppn_input_vector {Array} - 3-dimensional array that encodes the CPPN
 * @param water_level {number}
 * @param creepers_width {number}
 * @param creepers_height {number}
 * @param creepers_spacing {number}
 * @param smoothing {number}
 * @param creepers_type {boolean}
 * @param ground {Array} - List of points {x, y} composing the ground
 * @param ceiling {Array} - List of points {x, y} composing the ceiling
 * @param align {Object}
 * @param zoom {number} - Zoom to apply to the environment
 * @param scroll {{x: number, y:number}} - Scroll to apply to the environment
 */
function init_game(cppn_input_vector, water_level, creepers_width, creepers_height, creepers_spacing,
              smoothing, creepers_type, ground, ceiling, align, zoom=null, scroll=null) {

    let agents = {
        morphologies: [],
        policies: [],
        positions: []
    }

    // Pauses the game if it already exists and gets the information about the running agents
    if(window.game != null){
        window.game.pause();
        agents.morphologies = [...window.game.env.agents.map(a => a.morphology)];
        agents.policies = [...window.game.env.agents.map(a => a.policy)];
        agents.positions = [...window.game.env.agents.map(agent => agent.agent_body.reference_head_object.GetPosition())];
    }
    window.game = new Game(agents, cppn_input_vector, water_level, creepers_width, creepers_height,
                            creepers_spacing, smoothing, creepers_type, ground, ceiling, align);
    window.set_agent_selected(-1);
    window.asset_selected = null;

    if(zoom == null){
        window.game.env.set_zoom(INIT_ZOOM);
    }
    else {
        window.game.env.set_zoom(zoom);
    }

    if(scroll == null){
        window.game.env.set_scroll(window.agent_selected, INIT_SCROLL_X, 0);
    }
    else{
        window.game.env.set_scroll(window.agent_selected, scroll[0], scroll[1]);
    }
    window.game.env.render();
}

/**
 * Indicates if the creepers type is 'Swingable' or not.
 * @returns {boolean}
 */
function getCreepersType() {
    return document.getElementById("creepersType").value == 'Swingable';
}

/**
 * First function called after the code is entirely loaded.
 * Loads the model of the CPPN, initializes the game by default, loads the default environmnent and starts the language selection.
 * @returns {Promise<void>}
 */
async function onLoadInit() {
    window.cppn_model = await tf.loadGraphModel('./js/CPPN/weights/same_ground_ceiling_cppn/tfjs_model/model.json');
    window.init_default();
    window.loadDefaultEnv();
    window.langIntroSetUp();
}

// Calls onLoadInit() when all the files are loaded
window.addEventListener("load", onLoadInit, false);

/* IN-CANVAS MOUSE INTERACTIONS */

/**
 * Converts the given position relative to the canvas to the environment scale.
 * @param x_pos {number} - X-coordinate inside the canvas.
 * @param y_pos {number} - Y-coordinate inside the canvas.
 * @returns {{x: number, y: number}} - Position inside the environment.
 */
function convertPosCanvasToEnv(x_pos, y_pos){
    let x = Math.max(-window.canvas.width * 0.01, Math.min(x_pos, window.canvas.width * 1.01));
    let y = Math.max(0, Math.min(y_pos, window.canvas.height));

    x +=  window.game.env.scroll[0];
    y = -(y - window.game.env.scroll[1]);

    x = x / (window.game.env.scale * window.game.env.zoom);
    y = y / (window.game.env.scale * window.game.env.zoom);

    y += (1 - window.game.env.scale * window.game.env.zoom) * RENDERING_VIEWER_H/(window.game.env.scale * window.game.env.zoom)
        + (window.game.env.zoom - 1) * (window.game.env.ceiling_offset)/window.game.env.zoom * 1/3 + RENDERING_VIEWER_H;

    return {x: x, y: y};
}

/**
 * Converts the given position relative to the environment to the canvas scale.
 * @param x_pos {number} - X-coordinate inside the environment.
 * @param y_pos {number} - Y-coordinate inside the environment.
 * @returns {{x: number, y: number}} - Position inside the canvas.
 */
function convertPosEnvToCanvas(x_pos, y_pos){
    let x = x_pos * window.game.env.scale * window.game.env.zoom - window.game.env.scroll[0];
    let y = window.game.env.scroll[1] - (y_pos - RENDERING_VIEWER_H) * window.game.env.scale * window.game.env.zoom
        + (1 - window.game.env.scale * window.game.env.zoom) * RENDERING_VIEWER_H
        + (window.game.env.zoom - 1) * window.game.env.ceiling_offset * window.game.env.scale * 1/3;

    return {x: x, y: y};
}

/**
 * Checks if the given position is inside the given body.
 * Used for clicking on assets.
 * @param pos {{x: number, y: number}}
 * @param body {b2Body} - A Box2D body
 * @returns {boolean}
 */
function isPosInsideBody(pos, body){
    let shape = body.GetFixtureList().GetShape();

    if(shape.m_type == b2.Shape.e_circle){
        let center = body.GetWorldCenter();
        return Math.pow(center.x - pos.x, 2) + Math.pow(center.y - pos.y, 2) <= Math.pow(shape.m_radius, 2);
    }
}

/**
 * Handles actions when mouse is pressed.
 */
function mousePressed(){

    // Hides all the tooltips when mouse pressed
    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((el, index) => {
        let tooltip = bootstrap.Tooltip.getInstance(el);
        tooltip.hide();
    });

    // Case mouse is pressed inside the canvas
    if(mouseX >= 0 && mouseX <= window.canvas.width
        && mouseY >= 0 && mouseY <= window.canvas.height){

        // Stores the current position of the mouse, used when dragging
        window.prevMouseX = mouseX;
        window.prevMouseY = mouseY;

        // Creates a circle asset at the mouse position and render the environment
        if(window.is_drawing_circle()){
            let mousePos = convertPosCanvasToEnv(mouseX, mouseY);
            window.game.env.create_circle_asset(mousePos, window.asset_size * 2 / window.game.env.scale);

            if(window.agent_selected != null){
                window.agent_selected.is_selected = false;
                window.set_agent_selected(-1);
            }
            window.game.env.render();
        }

        // Handles agents and assets selection
        else if(!window.is_drawing()){
            let mousePos = convertPosCanvasToEnv(mouseX, mouseY);

            // Selects an agent in the canvas if the mouse is clicked over its body
            let one_agent_touched = false;
            for(let i = 0; i < window.game.env.agents.length; i++){
                let agent = window.game.env.agents[i];

                // Checks if the agent is touched by the mouse
                let is_agent_touched = agent.agent_body.isPosInside(mousePos);

                // If the agent is touched and not selected yet, it is now selected and all other agents are deselected
                if(is_agent_touched){
                    one_agent_touched = true;

                    if(!agent.is_selected) {
                        agent.is_selected = true;
                        window.set_agent_selected(i);
                        for (let other_agent of window.game.env.agents) {
                            if (other_agent != agent) {
                                other_agent.is_selected = false;
                            }
                        }
                    }
                    break;
                }
                // If the agent is not touched it is deselected
                else {
                    agent.is_selected = false;
                }
            }

            // If no agent is touched, the selected agent is set to null
            if(!one_agent_touched && window.agent_selected != null){
                window.set_agent_selected(-1);
            }

            // Selects an asset in the canvas if the mouse is clicked over its body and no agent has been touched
            if(!one_agent_touched){
                let one_asset_touched = false;
                for(let asset of window.game.env.assets_bodies){

                    // Checks if the asset is touched by the mouse
                    let is_asset_touched = isPosInsideBody(mousePos, asset.body);

                    // If the asset is touched and not selected yet, it is now selected and all other assets are deselected
                    if(is_asset_touched){
                        one_asset_touched = true;

                        if(!asset.is_selected){
                            asset.is_selected = true;
                            window.asset_selected = asset;
                            for(let other_asset of window.game.env.assets_bodies){
                                if(other_asset != asset){
                                    other_asset.is_selected = false;
                                }
                            }
                            break;
                        }
                    }
                    // If the asset is not touched it is deselected
                    else if(!is_asset_touched){
                        asset.is_selected = false;
                    }
                }

                // If no asset is touched, the selected asset is set to null
                if(!one_asset_touched && window.asset_selected != null){
                    window.asset_selected = null;
                }
            }

            window.game.env.render();
        }
    }
}

// Handles clicks outside canvas when drawing (deselect drawing buttons)
document.addEventListener('mousedown', (event) => {
    if(window.is_drawing() || window.is_drawing_circle()){
        let canvas_id = "#" + window.canvas.canvas.id;

        // Elements that can be clicked without deselecting drawing buttons: canvas + ground, ceiling, erase buttons
        let authorized_elements = [
            document.querySelector(canvas_id),
            document.querySelector('#drawGroundButton'),
            document.querySelector('#drawCeilingButton'),
            document.querySelector('#eraseButton')
        ];

        // If
        if(authorized_elements.indexOf(event.target) == -1) {
            window.deselectDrawingButtons();
        }
    }
});

/**
 * Handles actions when mouse is dragged.
 * @returns {boolean}
 */
function mouseDragged(){

    // Case mouse is dragged inside the canvas
    if(mouseX >= 0 && mouseX <= window.canvas.width
        && mouseY >= 0 && mouseY <= window.canvas.height) {

        // DRAWING
        if(window.is_drawing()) {

            // Gets the position of the mouse in the environment scale
            let mousePos = convertPosCanvasToEnv(mouseX, mouseY);

            // Vertical offset to shift the drawing, trace and forbidden canvas in order to align them to the environment
            let y_offset = SCROLL_Y_MAX - window.game.env.scroll[1];

            // Drawing ground to the right of the terrain startpad
            if(window.is_drawing_ground() && mousePos.x > (INITIAL_TERRAIN_STARTPAD - 1) * TERRAIN_STEP){
                drawing_canvas.push();
                drawing_canvas.stroke("#66994D");
                drawing_canvas.strokeWeight(4);
                // Draws a ground line between the current and previous positions of the mouse
                drawing_canvas.line(mouseX, mouseY + y_offset, window.prevMouseX, window.prevMouseY + y_offset);
                drawing_canvas.pop();
                window.terrain.ground.push(mousePos);
            }

            // Drawing ceiling to the right of the terrain startpad
            else if(window.is_drawing_ceiling() && mousePos.x > (INITIAL_TERRAIN_STARTPAD - 1) * TERRAIN_STEP){
                drawing_canvas.push();
                drawing_canvas.stroke("#808080");
                drawing_canvas.strokeWeight(4);
                // Draws a ceiling line between the current and previous positions of the mouse
                drawing_canvas.line(mouseX, mouseY + y_offset, window.prevMouseX, window.prevMouseY + y_offset);
                drawing_canvas.pop();
                window.terrain.ceiling.push(mousePos);
            }

            // Erasing to the right of the terrain startpad
            else if(window.is_erasing() && mousePos.x > INITIAL_TERRAIN_STARTPAD * TERRAIN_STEP){

                // Draws a circle trace at the mouse position to show the erasing radius
                trace_canvas.clear();
                trace_canvas.noStroke();
                trace_canvas.fill(255);
                trace_canvas.circle(mouseX, mouseY + y_offset, window.erasing_radius * 2);

                // Removes the points that are within the circle's radius from the ground and ceiling lists
                window.terrain.ground = window.terrain.ground.filter(function(point, index, array){
                    return Math.pow(point.x - mousePos.x, 2) + Math.pow(point.y - mousePos.y, 2) > Math.pow(window.erasing_radius / (window.game.env.scale * window.game.env.zoom), 2);
                });
                window.terrain.ceiling = window.terrain.ceiling.filter(function(point, index, array){
                    return Math.pow(point.x - mousePos.x, 2) + Math.pow(point.y - mousePos.y, 2) > Math.pow(window.erasing_radius / (window.game.env.scale * window.game.env.zoom), 2);
                });

                // Erases the drawing canvas inside the circle's radius
                drawing_canvas.erase();
                drawing_canvas.circle(mouseX, mouseY + y_offset, window.erasing_radius * 2);
                drawing_canvas.noErase();
            }

            // Dragging to scroll
            else{
                cursor(MOVE);
                window.game.env.set_scroll(null, window.game.env.scroll[0] + window.prevMouseX - mouseX, window.game.env.scroll[1] + mouseY - prevMouseY);

                // Re-draws the terrain shapes according to the new scroll
                window.refresh_drawing();
                y_offset = SCROLL_Y_MAX - window.game.env.scroll[1];
            }

            // Renders the environment and displays the off-screen canvas on top of it
            window.game.env.render();
            image(drawing_canvas, 0, -y_offset);
            image(trace_canvas, 0, -y_offset);
            image(forbidden_canvas, 0, -y_offset);
        }

        // DRAGGING
        else{
            cursor(MOVE);

            // Dragging an agent
            for (let agent of window.game.env.agents) {

                // Drags the selected agent
                if (agent.is_selected) {

                    // Computes the terrain's length according to the agent's morphology
                    let terrain_length;
                    if (agent.agent_body.body_type == BodyTypesEnum.CLIMBER) {
                        terrain_length = window.game.env.terrain_ceiling[window.game.env.terrain_ceiling.length - 1].x;
                    }
                    else if (agent.agent_body.body_type == BodyTypesEnum.WALKER) {
                        terrain_length = window.game.env.terrain_ground[window.game.env.terrain_ground.length - 1].x;
                    }
                    else if(agent.agent_body.body_type == BodyTypesEnum.SWIMMER){
                        terrain_length = Math.max(window.game.env.terrain_ground[window.game.env.terrain_ground.length - 1].x,
                                                    window.game.env.terrain_ceiling[window.game.env.terrain_ceiling.length - 1].x);
                    }

                    // Gets the mouse position inside the environment and clamps it horizontally to the edges of the terrain
                    let mousePos = convertPosCanvasToEnv(mouseX, mouseY);
                    let x = Math.max(0.02, Math.min(0.98, mousePos.x / terrain_length)) * terrain_length;

                    // Sets the position of the agent to the mouse position
                    window.game.env.set_agent_position(agent, x, mousePos.y);
                    window.game.env.render();
                    window.is_dragging_agent = true;
                    break;
                }
            }

            // Dragging an asset
            for(let asset of window.game.env.assets_bodies){

                // Drags the selected asset
                if (asset.is_selected && !window.is_dragging_agent) {
                    let terrain_length = Math.max(window.game.env.terrain_ground[window.game.env.terrain_ground.length - 1].x,
                                                    window.game.env.terrain_ceiling[window.game.env.terrain_ceiling.length - 1].x);

                    // Gets the mouse position inside the environment and clamps it horizontally to the edges of the terrain
                    let mousePos = convertPosCanvasToEnv(mouseX, mouseY);
                    mousePos.x = Math.max(0.02, Math.min(0.98, mousePos.x / terrain_length)) * terrain_length;

                    // Sets the position of the asset to the mouse position
                    window.game.env.set_asset_position(asset, mousePos);
                    window.game.env.render();
                    window.is_dragging_asset = true;
                }
            }

            // Dragging to scroll
            if(!window.is_dragging_agent && !window.is_dragging_asset){

                // Scrolling manually cancels agent following
                if(window.agent_followed != null){
                    window.set_agent_followed(-1);
                }
                window.game.env.set_scroll(null, window.game.env.scroll[0] + window.prevMouseX - mouseX, window.game.env.scroll[1] + mouseY - prevMouseY);
                window.game.env.render();
            }
        }
    }

    // Dragging an agent horizontally out of canvas
    else if(window.is_dragging_agent
        && mouseY >= 0 && mouseY < window.canvas.height){

        if(mouseX < 0){
            window.dragging_side = "left";
        }
        else if(mouseX > window.canvas.width){
            window.dragging_side = "right";
        }

        cursor(MOVE);

        // Dragging an agent
        for (let agent of window.game.env.agents) {

            // Drags the selected agent
            if (agent.is_selected) {

                // Scrolls horizontally according to the dragging side to follow the agent
                window.game.env.set_scroll(null);

                // Computes the terrain's length according to the agent's morphology
                let terrain_length;
                if (agent.agent_body.body_type == BodyTypesEnum.CLIMBER) {
                    terrain_length = window.game.env.terrain_ceiling[window.game.env.terrain_ceiling.length - 1].x;
                }
                else if (agent.agent_body.body_type == BodyTypesEnum.WALKER) {
                    terrain_length = window.game.env.terrain_ground[window.game.env.terrain_ground.length - 1].x;
                }
                else if(agent.agent_body.body_type == BodyTypesEnum.SWIMMER){
                    terrain_length = Math.max(window.game.env.terrain_ground[window.game.env.terrain_ground.length - 1].x,
                        window.game.env.terrain_ceiling[window.game.env.terrain_ceiling.length - 1].x);
                }

                // Gets the mouse position inside the environment and clamps it horizontally to the edges of the terrain
                let mousePos = convertPosCanvasToEnv(mouseX, mouseY);
                let x = Math.max(0.02, Math.min(0.98, mousePos.x / terrain_length)) * terrain_length;

                // Sets the position of the agent to the mouse position
                window.game.env.set_agent_position(agent, x, mousePos.y);
                window.game.env.render();
                break;
            }
        }

        // Prevents default behaviour when dragging the mouse
        return false;
    }

    window.prevMouseX = mouseX;
    window.prevMouseY = mouseY;
}

/**
 * Handles actions when mouse is released.
 */
function mouseReleased(){
    cursor();
    window.is_dragging_agent = false;
    window.is_dragging_asset = false;
    window.dragging_side = null;
}

/**
 * Handles actions when mouse is moved.
 */
function mouseMoved(){

    // Draws the trace of the circle asset at the mouse position
    if(window.is_drawing_circle()){
        trace_canvas.clear();
        if(mouseX >= 0 && mouseX <= window.canvas.width
            && mouseY >= 0 && mouseY <= window.canvas.height) {
            trace_canvas.noStroke();
            trace_canvas.fill(136, 92, 0, 180);
            trace_canvas.circle(mouseX, mouseY + SCROLL_Y_MAX - window.game.env.scroll[1], window.asset_size * 4 * window.game.env.zoom);
        }
        window.game.env.render();
        image(trace_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
    }

    // Draws the trace of the eraser at the mouse position
    else if (window.is_erasing()) {
        trace_canvas.clear();
        if (mouseX >= 0 && mouseX <= window.canvas.width
            && mouseY >= 0 && mouseY <= window.canvas.height) {
            trace_canvas.noStroke();
            trace_canvas.fill(255, 180);
            trace_canvas.circle(mouseX, mouseY + SCROLL_Y_MAX - window.game.env.scroll[1], window.erasing_radius * 2);
        }
        window.game.env.render();
        image(drawing_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
        image(trace_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
        image(forbidden_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
    }
}

/**
 * Handles actions when a mouse wheel event is detected (actual mouse wheel or touchpad).
 * @param event {WheelEvent}
 * @returns {boolean}
 */
function mouseWheel(event){
    if(mouseX >= 0 && mouseX <= window.canvas.width
        && mouseY >= 0 && mouseY <= window.canvas.height) {

        trace_canvas.clear();

        // Resizes circle asset radius
        if(window.is_drawing_circle()){
            window.asset_size = Math.max(3, Math.min(window.asset_size - event.delta / 100, 30));
            trace_canvas.noStroke();
            trace_canvas.fill(136, 92, 0, 180);
            trace_canvas.circle(mouseX, mouseY + SCROLL_Y_MAX - window.game.env.scroll[1], window.asset_size * 4 * window.game.env.zoom);
            window.game.env.render();
            image(trace_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
        }

        // Resizes erasing radius
        else if(window.is_erasing()){
            window.erasing_radius = Math.max(5, Math.min(window.erasing_radius - event.delta / 100, 30));
            trace_canvas.noStroke();
            trace_canvas.fill(255, 180);
            trace_canvas.circle(mouseX, mouseY + SCROLL_Y_MAX - window.game.env.scroll[1], window.erasing_radius * 2);
            window.game.env.render();
            image(drawing_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
            image(trace_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
            image(forbidden_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
        }

        // Zooms in or out
        else {
            window.game.env.set_zoom(window.game.env.zoom - event.delta / 2000);
            // TODO: scroll on the mouse position
            window.game.env.set_scroll(null, window.game.env.scroll[0], window.game.env.scroll[1]);

            // If drawing mode, re-draws the terrain shapes according to the new zoom
            if(window.is_drawing()){
                window.refresh_drawing();
                window.game.env.render();
                image(drawing_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
                image(forbidden_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
            }
            else{
                window.game.env.render();
            }

        }

        // Prevents default behaviour for mouse wheel events inside the canvas
        return false;
    }
}

/**
 * Handles actions when a key is pressed.
 * @returns {boolean}
 */
function keyPressed(){
    // Deletes the agent or asset selected when pressing the delete key
    if(keyCode == DELETE){
        if(window.agent_selected != null){
            window.delete_agent(agent_selected);
            window.agent_selected(null);
            return false;
        }
        else if(window.asset_selected != null){
            window.game.env.delete_asset(window.asset_selected);
            window.asset_selected = null;
            window.game.env.render();
            return false;
        }
    }
}

/**
 * Handles actions when the window is resized.
 */
function windowResized(){

    let canvas_container = document.querySelector('#canvas_container');

    // Recomputes RENDERING_VIEWER_W, INIT_ZOOM and THUMBNAIL_ZOOM
    RENDERING_VIEWER_W = canvas_container.offsetWidth;
    INIT_ZOOM = RENDERING_VIEWER_W / ((TERRAIN_LENGTH + INITIAL_TERRAIN_STARTPAD) * 1.05 * TERRAIN_STEP * SCALE);
    THUMBNAIL_ZOOM = RENDERING_VIEWER_W / ((TERRAIN_LENGTH + INITIAL_TERRAIN_STARTPAD) * 0.99 * TERRAIN_STEP * SCALE);

    // Resizes the main canvas
    resizeCanvas(RENDERING_VIEWER_W, RENDERING_VIEWER_H);
    drawing_canvas.resizeCanvas(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
    trace_canvas.resizeCanvas(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
    forbidden_canvas.resizeCanvas(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);

    // Generates the terrain from the drawing
    if(is_drawing()){
        window.refresh_drawing();
        window.game.env.render();
        image(drawing_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
        image(forbidden_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
    }
    // Re-initializes the environment
    else{
        window.init_default();
    }
}

window.downloadObjectAsJson = (exportObj, exportName) => {
    let dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(exportObj));
    let downloadAnchorNode = document.createElement('a');
    downloadAnchorNode.setAttribute("href",     dataStr);
    downloadAnchorNode.setAttribute("download", exportName + ".json");
    document.body.appendChild(downloadAnchorNode); // required for firefox
    downloadAnchorNode.click();
    downloadAnchorNode.remove();
}

window.strUcFirst = (a) => {
    return (a+'').charAt(0).toUpperCase()+a.substr(1);
}

window.draw_forbidden_area = () => {
    forbidden_canvas.clear();
    forbidden_canvas.stroke("#FF0000");
    forbidden_canvas.strokeWeight(3);
    forbidden_canvas.fill(255, 50, 0, 75);
    let w = convertPosEnvToCanvas((INITIAL_TERRAIN_STARTPAD - 1) * TERRAIN_STEP, 0).x;
    forbidden_canvas.rect(0, 0, w, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
}
