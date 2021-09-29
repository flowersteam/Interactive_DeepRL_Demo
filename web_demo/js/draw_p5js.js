p5.disableFriendlyErrors = true; // disables FES

// Colors to be used for the joints
let JOINTS_COLORS = {
    "creeper": "#00B400",
    "hip": "#FF7818",
    "knee": "#F4BE18",
    "neck": "#0000FF",
    "shoulder": "#6CC9FF",
    "elbow": "#FF00AA",
    "hand": "#FF8CFF",
    "grip": "#FF0000",
};

// Secondary off-screen canvas
let drawing_canvas; // Used to draw the terrain shapes
let trace_canvas; // Used to draw the erase and assets traces following the mouse
let forbidden_canvas; // Used to draw the forbidden red area on the terrain startpad
let tmp_canvas;

/**
 * Creates the different canvas and sets them up. Called automatically when the programs starts.
 */
function setup() {
    let canvas_container = document.querySelector('#canvas_container');
    RENDERING_VIEWER_W = canvas_container.offsetWidth;
    window.canvas = createCanvas(RENDERING_VIEWER_W, RENDERING_VIEWER_H);
    INIT_ZOOM = RENDERING_VIEWER_W / ((TERRAIN_LENGTH + INITIAL_TERRAIN_STARTPAD) * 1.05 * TERRAIN_STEP * SCALE);
    THUMBNAIL_ZOOM = RENDERING_VIEWER_W / ((TERRAIN_LENGTH + INITIAL_TERRAIN_STARTPAD) * 0.99 * TERRAIN_STEP * SCALE);
    canvas.parent("canvas_container");
    canvas.style('display', 'block');
    canvas.style('margin-left', 'auto');
    canvas.style('margin-right', 'auto');

    // Creates the off-screen canvas. Height is bigger than main canvas' so that one can scroll vertically when drawing.
    drawing_canvas = createGraphics(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
    trace_canvas = createGraphics(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
    forbidden_canvas = createGraphics(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);
    tmp_canvas = createGraphics(RENDERING_VIEWER_W + SCROLL_X_MAX, RENDERING_VIEWER_H + 2 * SCROLL_Y_MAX);

    // Prevents automatic calls the draw() function
    noLoop();
}

/**
 * Converts one rgb component to hexadecimal.
 * @param c {number}
 * @return {string}
 */
function componentToHex(c) {
    let hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

/**
 * Converts the rgb array to hexadecimal string.
 * @param rgb {Array}
 * @return {string}
 */
function rgbToHex(rgb) {
    return "#" + componentToHex(rgb[0]) + componentToHex(rgb[1]) + componentToHex(rgb[2]);
}

/**
 * Converts hexadecimal string to rgb array
 * @param hex
 * @return {[number, number, number]}
 */
function hexToRgb(hex) {
    let result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    let rgb = [
        parseInt(result[1], 16),
        parseInt(result[2], 16),
        parseInt(result[3], 16)
    ];
    return result ? rgb : null;
}

/**
 * Color agent's head depending on its 'dying' state.
 * @param agent {Object}
 * @param c1 {Array}
 * @param c2 {Array}
 * @return {Array}
 */
function color_agent_head(agent, c1, c2){
    let ratio = 0;
    if(agent.agent_body.body_type == BodyTypesEnum.SWIMMER){
        ratio = agent.nb_steps_outside_water / agent.agent_body.nb_steps_can_survive_outside_water;
    }
    else {
        ratio = agent.nb_steps_under_water / agent.agent_body.nb_steps_can_survive_under_water;
    }

    let color1 = [
        c1[0] + ratio * (1.0 - c1[0]),
        c1[1] + ratio * (0.0 - c1[1]),
        c1[2] + ratio * (0.0 - c1[2])
    ]
    let color2 = c2;
    return [color1, color2];
}

/**
 * Renders all the elements of the environment.
 */
function draw() {
    if(window.game != null){
        let env = window.game.env;
        push();

        drawTerrain(env);

        // Renders the agents if not drawing mode
        if(!window.is_drawing()){
            for(let agent of env.agents){

                // Draws the agent morphology
                drawAgent(agent, env.scale);

                // Draws the agent's lidars
                if(window.draw_lidars){
                    drawLidars(agent.lidars, env.scale);
                }

                // Draws the agent's observation
                if(window.draw_observation){
                    drawObservation(agent, env.scale);
                }

                // Draws the agent's rewards
                if(window.draw_reward){
                    drawReward(agent, env.scale);
                }

                // Draws the agent's joints
                if(window.draw_joints){

                    // Agent motors
                    let joints = [...agent.agent_body.motors];

                    // Adds neck joint and grip joints for climbers
                    if(agent.agent_body.body_type == BodyTypesEnum.CLIMBER){
                        joints.push(agent.agent_body.neck_joint);
                        let grip_joints = [...agent.agent_body.sensors.map(s => s.GetUserData().has_joint ? s.GetUserData().joint : null)];
                        joints = joints.concat(grip_joints);
                    }
                    drawJoints(joints, env.scale);
                }

                // Draws the agent's name
                if(window.draw_names){
                    drawName(agent, env.scale);
                }
            }
        }

        // Draws creepers joints
        if(window.draw_joints) {
            drawJoints(env.creepers_joints, env.scale);
        }

        pop();
    }
}

/**
 * Draws the given sensors.
 * @param sensors {Array}
 * @param scale {number} - Scale of the environment
 */
function drawSensors(sensors, scale){
    for(let i = 0; i < sensors.length; i++){
        let radius = sensors[i].GetFixtureList().GetShape().m_radius + 0.01;
        let sensor_world_center = sensors[i].GetPosition()//sensors[i].GetWorldCenter();
        noStroke();
        fill(255, 0, 0, 255);
        //fill("#FFFF00");
        circle(sensor_world_center.x, VIEWPORT_H - sensor_world_center.y, radius);
    }
}

/**
 * Draws the given joints.
 * @param joints
 * @param scale {number} - Scale of the environment
 */
function drawJoints(joints, scale){
    for(let i = 0; i < joints.length; i++){
        if(joints[i] != null){
            let posA = joints[i].m_bodyA.GetWorldPoint(joints[i].m_localAnchorA);
            let posB = joints[i].m_bodyB.GetWorldPoint(joints[i].m_localAnchorB);
            noStroke();
            let joint_type = joints[i].GetUserData().name;
            fill(JOINTS_COLORS[joint_type]);
            let radius = joint_type == "creeper" ? 5 : 7;
            circle(posA.x, VIEWPORT_H - posA.y, radius/scale);
            circle(posB.x, VIEWPORT_H - posB.y, radius/scale);
        }
    }
}

/**
 * Draws the name of the given agent.
 * @param agent {Object}
 * @param scale {number} - Scale of the environment
 */
function drawName(agent, scale){
    let pos = agent.agent_body.reference_head_object.GetPosition();
    fill(0);
    noStroke()
    textSize(25 / scale);
    textAlign(CENTER);
    let x_pos = pos.x;
    let y_pos;
    if(agent.morphology == "bipedal"){
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT/3;
    }
    else if(agent.morphology == "spider"){
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT / 2;
    }
    else if(agent.morphology == "chimpanzee"){
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT/2;
    }
    else if(agent.morphology == "fish"){
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT * 2;
    }
    let age = agent.age == "adult" ? "" : " (" + window.lang_dict[window.get_language()]['morphologies'][agent.age] + ")";
    text(agent.name + age, x_pos, RENDERING_VIEWER_H - y_pos);
}

/**
 * Draws all the body parts of the given agent.
 * @param agent {Object}
 * @param scale {number} - Scale of the environment
 */
function drawAgent(agent, scale){
    let stroke_coef = 1;

    if(agent.is_selected){
        stroke_coef = 2;
    }

    let polys = agent.agent_body.get_elements_to_render();
    for(let poly of polys){
        let shape = poly.GetFixtureList().GetShape();

        let vertices = [];
        for(let i = 0; i < shape.m_count; i++){
            let world_pos = poly.GetWorldPoint(shape.m_vertices[i]);
            vertices.push([world_pos.x, world_pos.y]);
        }

        strokeWeight(stroke_coef * 2/scale);
        stroke(poly.color2);
        let color1 = poly.color1;
        if(poly == agent.agent_body.reference_head_object){
            let rgb01 = hexToRgb(poly.color1).map(c => c / 255);
            let rgb255 = color_agent_head(agent, rgb01, poly.color2)[0].map(c => Math.round(c * 255));
            color1 = rgbToHex(rgb255);
        }
        drawPolygon(vertices, color1);
    }
}

/**
 * Draws the given lidars.
 * @param lidars {Array}
 * @param scale {number} - Scale of the environment
 */
function drawLidars(lidars, scale){
    for(let i = 0; i < lidars.length; i++){
        let lidar = lidars[i];

        // Draws a red line representing the lidar
        let vertices = [
            [lidar.p1.x, lidar.p1.y],
            [lidar.p2.x, lidar.p2.y]
        ];
        strokeWeight(1/scale);
        drawLine(vertices, "#FF0000");

    }
}

/**
 * Draws the different parts of the agent's observation.
 * @param agent {Object}
 * @param scale {number} - Scale of the environment
 */
function drawObservation(agent, scale){

    // Draws a circle depending to the surface detected by the lidar and the fraction of the lidar
    for(let i = 0; i < agent.lidars.length; i++) {
        let lidar = agent.lidars[i];
        if(lidar.fraction < 1){
            if(lidar.is_water_detected){
                noStroke();
                fill(0, 50 + (1 - lidar.fraction) * 160, 150 + (1 - lidar.fraction) * 105);
                circle(lidar.p2.x, VIEWPORT_H - lidar.p2.y, 5/scale);
            }
            else if(lidar.is_creeper_detected){
                noStroke();
                fill(0, 120 + (1 - lidar.fraction) * 135, 0);
                circle(lidar.p2.x, VIEWPORT_H - lidar.p2.y, 5/scale);
            }
            else{
                noStroke();
                fill(0, 120 + (1 - lidar.fraction) * 135, 0);
                circle(lidar.p2.x, VIEWPORT_H - lidar.p2.y, 5/scale);
            }
        }
    }

    // Draws a line corresponding to the agent's head angle
    let head = agent.agent_body.reference_head_object;
    let pos = head.GetPosition();
    let angle = head.GetAngle();
    let length = 2 * agent.agent_body.AGENT_WIDTH;
    if(agent.morphology == "spider"){
        length = agent.agent_body.AGENT_WIDTH / 2;
    }
    let vertices = [
        [pos.x - length * Math.cos(angle), pos.y - length * Math.sin(angle)],
        [pos.x + length * Math.cos(angle), pos.y + length * Math.sin(angle)]
    ];
    let color;
    if(Math.abs(angle) > Math.PI / 10){
        color = "#FF0000";
    }
    else if(Math.abs(angle) > Math.PI / 40){
        color = "#F4BE18";
    }
    else{
        color = "#00B400";
    }
    strokeWeight(2/scale);
    drawLine(vertices, color);

    // Draws an arrow corresponding to the agent's linear velocity
    let vel = head.GetLinearVelocity().Length();
    let x_pos;
    let y_pos;
    if(agent.morphology == "bipedal"){
        x_pos = pos.x - agent.agent_body.AGENT_WIDTH;
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT / 4;
    }
    else if(agent.morphology == "spider"){
        x_pos = pos.x - agent.agent_body.AGENT_WIDTH / 2;
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT / 4;
    }
    else if(agent.morphology == "chimpanzee"){
        x_pos = pos.x - agent.agent_body.AGENT_WIDTH;
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT / 3;
    }
    else if(agent.morphology == "fish"){
        x_pos = pos.x - agent.agent_body.AGENT_WIDTH;
        y_pos = pos.y + agent.agent_body.AGENT_HEIGHT * 1.5;
    }
    vertices = [
        [x_pos, y_pos],
        [x_pos + vel / 2, y_pos]
    ];
    strokeWeight(2/scale);
    drawLine(vertices, "#0070FF");

    vertices = [
        [x_pos + vel / 2 - 0.25, y_pos + Math.sin(Math.PI / 12)],
        [x_pos + vel / 2, y_pos]
    ]
    drawLine(vertices, "#0070FF");

    vertices = [
        [x_pos + vel / 2 - 0.25, y_pos - Math.sin(Math.PI / 12)],
        [x_pos + vel / 2, y_pos]
    ]
    drawLine(vertices, "#0070FF");
}

/**
 * Draws the agent's step and episodic reward.
 * @param agent {Object}
 * @param scale {number} - Scale of the environment
 */
function drawReward(agent, scale){
    // Text reward
    if(window.game.rewards.length > 0){

        let dict = window.lang_dict[window.get_language()]['advancedOptions'];

        let pos = agent.agent_body.reference_head_object.GetPosition();

        let x_pos;
        let y_pos;
        if(agent.morphology == "bipedal"){
            x_pos = pos.x + agent.agent_body.AGENT_WIDTH * 3/2;
            y_pos = pos.y + agent.agent_body.AGENT_HEIGHT;
        }
        else if(agent.morphology == "spider"){
            x_pos = pos.x + agent.agent_body.AGENT_WIDTH / 2;
            y_pos = pos.y + agent.agent_body.AGENT_HEIGHT * 3/2;
        }
        else if(agent.morphology == "chimpanzee"){
            x_pos = pos.x + 8 * agent.agent_body.AGENT_WIDTH;
            y_pos = pos.y - agent.agent_body.AGENT_HEIGHT;
        }
        else if(agent.morphology == "fish"){
            x_pos = pos.x + 9 * agent.agent_body.AGENT_WIDTH;
            y_pos = pos.y;
        }

        noStroke()
        fill(0);
        textSize(20/ scale);
        textAlign(RIGHT);
        text(dict['stepReward'] + " = ", x_pos, RENDERING_VIEWER_H - y_pos);
        text(dict['totalReward'] + " = ", x_pos, RENDERING_VIEWER_H - (y_pos - 1));

        let reward = window.game.rewards[window.game.rewards.length - 1][agent.id].toPrecision(3);
        if(reward > 0.35){
            fill("#00B400");
        }
        else if(reward > 0.15){
            fill("#F4BE18");
        }
        else {
            fill("#FF0000");
        }

        textAlign(LEFT);
        text(reward, x_pos, RENDERING_VIEWER_H - y_pos);

        let ep_reward = agent.episodic_reward.toPrecision(3);
        if(ep_reward > 230){
            fill("#00B400");
        }
        else {
            fill(0);
        }
        text(ep_reward, x_pos, RENDERING_VIEWER_H - (y_pos - 1));
    }
}

/**
 * Draws the sky and the clouds
 * @param env
 */
function drawSkyClouds(env){
    push();

    // Sky
    background("#E6F0FF");

    // Translation to scroll horizontally and vertically
    translate(- env.scroll[0]/3, env.scroll[1]/3);

    // Rescaling
    scale(env.scale);
    scale(env.zoom * 3/4);

    // Translating so that the environment is always horizontally centered
    translate(0, (1 - env.scale * env.zoom) * VIEWPORT_H/(env.scale * env.zoom));
    translate(0, (env.zoom - 1) * (env.ceiling_offset)/env.zoom * 1/3);

    // Clouds
    for(let cloud of env.cloud_polys){
        noStroke();
        drawPolygon(cloud.poly, "#FFFFFF");
    }

    pop();
}

/**
 * Draws all the bodies composing the terrain of the given environment.
 * @param env {Object}
 */
function drawTerrain(env){
    // Updates scroll to stay centered on the agent position
    if(window.agent_followed != null){
        env.set_scroll(window.agent_followed, null, null);
    }

    // Sky & clouds
    drawSkyClouds(env);

    // Translation to scroll horizontally and vertically
    translate(- env.scroll[0], env.scroll[1]);

    // Rescaling
    scale(env.scale);
    scale(env.zoom);

    // Translating so that the environment is always horizontally centered
    translate(0, (1 - env.scale * env.zoom) * VIEWPORT_H/(env.scale * env.zoom));
    translate(0, (env.zoom - 1) * (env.ceiling_offset)/env.zoom * 1/3);

    // Water
    let vertices = [
        [-RENDERING_VIEWER_W, -RENDERING_VIEWER_H],
        [-RENDERING_VIEWER_W, env.water_y],
        [2 * RENDERING_VIEWER_W, env.water_y],
        [2 * RENDERING_VIEWER_W, -RENDERING_VIEWER_H]
    ];
    noStroke();
    drawPolygon(vertices, "#77ACE5");

    // Draws all background elements
    for(let i = 0; i < env.background_polys.length; i++) {
        let poly = env.background_polys[i];
        noStroke();
        drawPolygon(poly.vertices, poly.color);
    }

    // Draws all terrain elements
    for(let i = 0; i < env.terrain_bodies.length; i++) {
        let poly = env.terrain_bodies[i];
        let shape = poly.body.GetFixtureList().GetShape();
        let vertices = [];

        if(poly.type == "creeper"){
            for(let i = 0; i < shape.m_count; i++){
                let world_pos = poly.body.GetWorldPoint(shape.m_vertices[i]);
                vertices.push([world_pos.x, world_pos.y]);
            }
            noStroke();
            drawPolygon(vertices, poly.color1);
        }
        else{
            let v1 = poly.body.GetWorldPoint(shape.m_vertex1);
            let v2 = poly.body.GetWorldPoint(shape.m_vertex2);
            vertices = [[v1.x, v1.y], [v2.x, v2.y]];
            strokeWeight(1/env.scale);
            drawLine(vertices, poly.color);
        }
    }

    // Draws a flag on startpad
    let flag_y1 = TERRAIN_HEIGHT;
    let flag_y2 = flag_y1 + 90 / env.scale;
    let flag_x = TERRAIN_STEP * 3;
    vertices = [
        [flag_x, flag_y1],
        [flag_x, flag_y2]
    ]
    drawLine(vertices, "#000000");
    vertices = [
        [flag_x, flag_y2],
        [flag_x, flag_y2 - 20 / env.scale],
        [flag_x + 40 / env.scale, flag_y2 - 10 / env.scale]
    ]
    drawPolygon(vertices, "#E63300");

    // Draws all assets
    for(let asset of env.assets_bodies){
        let shape = asset.body.GetFixtureList().GetShape();

        let stroke_coef = asset.is_selected ? 2 : 1;

        if(asset.type == "circle"){
            let center = asset.body.GetWorldCenter();
            strokeWeight(stroke_coef * 2/env.scale);
            stroke(asset.color2);
            fill(asset.color1);
            circle(center.x, RENDERING_VIEWER_H - center.y, shape.m_radius * 2);
        }
    }
}

/**
 * Draws a polygon in the canvas with the given vertices.
 * @param vertices {Array}
 * @param color {string}
 */
function drawPolygon(vertices, color){
    fill(color);
    beginShape();
    for(let v of vertices){
        vertex(v[0], VIEWPORT_H - v[1]);
    }
    endShape(CLOSE);
}

/**
 * Draws a line in the canvas between the two vertices.
 * @param vertices {Array}
 * @param color {string}
 */
function drawLine(vertices, color){
    stroke(color);
    line(vertices[0][0], VIEWPORT_H - vertices[0][1], vertices[1][0], VIEWPORT_H - vertices[1][1]);
}