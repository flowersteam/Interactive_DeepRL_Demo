// All available UI state mutations
export default {

    /**
     * Adds the given environment to the specified set.
     * @param state {Object} - UI state
     * @param payload {{set: string, env: Object}}
     * @return {Object} - UI state
     */
    addEnv(state, payload){
        if(payload.set == 'base'){
            state.envsSets.baseEnvsSet.push(payload.env);
        }
        else if(payload.set == 'custom'){
            state.envsSets.customEnvsSet.push(payload.env);
        }

        // Sorts the set in the lexicographic order according to the name of the envs
        state.envsSets.baseEnvsSet.sort(function(a, b){

            // Exception for env whose name begins with "Flat": always first
            if(a.description["EN"].name.split(" ")[0] == "Flat"){
                return -1;
            }
            else if(b.description["EN"].name.split(" ")[0] == "Flat"){
                return 1;
            }
            else{
                return a.description["EN"].name.localeCompare(b.description["EN"].name);
            }
        });
        return state;
    },

    /**
     * Removes the environment of the given index from the custom set.
     * @param state {Object} - UI state
     * @param payload {number} - Index of the environment to remove
     * @return {Object} - UI state
     */
    deleteEnv(state, payload){
        state.envsSets.customEnvsSet.splice(payload, 1);
        return state;
    },

    /**
     * Updates the given terrain parameter.
     * @param state {Object} - UI state
     * @param payload {{name: string, value: number}} - Name and value of the terrain parameter to change
     * @return {Object} - UI state
     */
    updateParkourConfig(state, payload){
        switch (payload.name) {
            case 'dim1':
                state.parkourConfig.terrain.dim1 = payload.value;
                break;
            case 'dim2':
                state.parkourConfig.terrain.dim2 = payload.value;
                break;
            case 'dim3':
                state.parkourConfig.terrain.dim3 = payload.value;
                break;
            case 'smoothing':
                state.parkourConfig.terrain.smoothing = payload.value;
                break;
            case 'waterLevel':
                state.parkourConfig.terrain.waterLevel = payload.value;
                break;
            case 'width':
                state.parkourConfig.creepers.width = payload.value;
                break;
            case 'height':
                state.parkourConfig.creepers.height = payload.value;
                break;
            case 'spacing':
                state.parkourConfig.creepers.spacing = payload.value;
                break;
            case 'type':
                state.parkourConfig.creepers.type = payload.value;
                break;
        }
        return state;
    },

    /**
     * Initializes the game with default parameters.
     * @param state {Object} - UI state
     * @param payload {}
     * @return {Object} - UI state
     */
    init_default(state, payload){
        state.simulationState.status = 'init';

        if(window.game != null){
            window.align_terrain = {
                align: false, // no alignment
                ceiling_offset: window.ceiling.length > 0 ? window.game.env.ceiling_offset - window.ceiling[0].y : null,
                ground_offset: window.ground.length > 0 ? window.ground[0].y : null, // first ground y value
                smoothing: window.game.env.TERRAIN_CPPN_SCALE // current smoothing
            };
        }

        let terrainConfig = state.parkourConfig.terrain;
        let creepersConfig = state.parkourConfig.creepers;
        init_game(
            [terrainConfig.dim1, terrainConfig.dim2, terrainConfig.dim3],
            terrainConfig.waterLevel,
            creepersConfig.width,
            creepersConfig.height,
            creepersConfig.spacing,
            terrainConfig.smoothing,
            creepersConfig.type == 'Swingable',
            window.ground,
            window.ceiling,
            window.align_terrain
        );
    },

    /**
     * Runs the simulation.
     * @param state {Object} - UI state
     * @param payload {}
     * @return {Object} - UI state
     */
    startSimulation(state, payload) {
        state.simulationState.status = 'running';
        window.game.run();
        return state;
    },

    /**
     * Pauses the simulation.
     * @param state {Object} - UI state
     * @param payload {}
     * @return {Object} - UI state
     */
    pauseSimulation(state, payload) {
        window.game.pause();
        state.simulationState.status = 'paused';
        return state;
    },

    /**
     * Resets the simulation.
     * @param state {Object} - UI state
     * @param payload {{keepPositions: boolean}}
     * @return {Object} - UI state
     */
    resetSimulation(state, payload) {
        state.simulationState.status = 'init';

        // Gets the morphology, policy and position of the current running agents
        const agents = {
            morphologies: state.agents.map(a => a.morphology),
            policies: state.agents.map(a => {
                return {
                    name: a.name,
                    age: a.age,
                    path: a.path
                };
            }),
            positions: []
        }
        // Gets the current position of each agent
        if (payload.keepPositions) {
            agents.positions = [...state.agents.map((agent, index) => window.game.env.agents[index].agent_body.reference_head_object.GetPosition())];
        }
        // Gets the initial position of each agent
        else {
            agents.positions = [...state.agents.map((agent, index) => window.game.env.agents[index].init_pos)];
        }

        const terrainConfig = state.parkourConfig.terrain;
        const creepersConfig = state.parkourConfig.creepers;

        // Updates the terrain alignment
        window.align_terrain = {
            align: true, // aligns the terrain with the startpad
            ceiling_offset: window.align_terrain.ceiling_offset, // keeps the same
            ground_offset: window.align_terrain.ground_offset, // keeps the same
            smoothing: window.game.env.TERRAIN_CPPN_SCALE // smoothing of the current terrain
        };

        // Reinitializes the environment
        window.game.reset(
            agents,
            [terrainConfig.dim1,terrainConfig.dim2,terrainConfig.dim3],
            terrainConfig.waterLevel,
            creepersConfig.width,
            creepersConfig.height,
            creepersConfig.spacing,
            terrainConfig.smoothing,
            creepersConfig.type == "Swingable",
            window.ground,
            window.ceiling,
            window.align_terrain);
        return state;
    },

    /**
     * Adds the given agent to the environment and renders it.
     * @param state {Object} - UI state
     * @param payload {{morphology: string, name: string, age: string, path: string, init_pos: {x: number, y: number}}}
     * @return {Object} - UI state
     */
    addAgent(state, payload) {
        state.agents.push(payload);
        if(window.game != null){
            window.game.env.add_agent(payload.morphology, {name: payload.name, age: payload.age, path: payload.path}, payload.init_pos);
            window.game.env.render();
        }
        return state;
    },

    /**
     * Removes the agent of the given index from environment and renders it.
     * @param state {Object} - UI state
     * @param payload {{index: number}}
     * @return {Object} - UI state
     */
    deleteAgent(state, payload) {
        state.agents.splice(payload.index, 1);
        if(window.game != null){
            window.game.env.delete_agent(payload.index);
            window.game.env.render();
        }
        return state;
    },

    /**
     * Sets the initial position of the agent of the given index.
     * @param state {Object} - UI state
     * @param payload {{index: number, init_pos: {x: number, y: number}}}
     * @return {Object} - UI state
     */
    setAgentInitPos(state, payload){
        window.game.env.agents[payload.index].init_pos = payload.init_pos;
        state.agents[payload.index].init_pos = payload.init_pos;
        return state;
    },

    /**
     * Selects the agent of the given index.
     * @param state {Object} - UI state
     * @param payload {{index: number}}
     * @return {Object} - UI state
     */
    selectAgent(state, payload) {
        if(payload.index != -1){
            window.agent_selected = window.game.env.agents[payload.index];
            state.simulationState.agentSelected = state.agents[payload.index];
        }
        // Sets the selected agent to null if index == -1
        else{
            window.agent_selected = null;
            state.simulationState.agentSelected = null;
        }
        return state;
    },

    /**
     * Follows the agent of the given index and renders the environment.
     * @param state {Object} - UI state
     * @param payload {{index: number}}
     * @return {Object} - UI state
     */
    followAgent(state, payload) {
        if(payload.index != -1){
            window.agent_followed = window.game.env.agents[payload.index];
            state.simulationState.agentFollowed = state.agents[payload.index];
        }
        // Sets the followed agent to null if index == -1
        else {
            window.agent_followed = null;
            state.simulationState.agentFollowed = null;
        }
        window.game.env.render();
        return state;
    },

    /**
     * Renames the agent of the given index with the given string value.
     * @param state {Object} - UI state
     * @param payload {{index: number, value: string}}
     * @return {Object} - UI state
     */
    renameAgent(state, payload) {
        state.agents[payload.index].name = payload.value;
        window.game.env.agents[payload.index].name = payload.value;
        window.game.env.render();
        return state;
    },

    /**
     * Selects the seed option of the given index for the given morphology.
     * @param state {Object} - UI state
     * @param payload {{morphology: string, index: number}}
     * @return {Object} - UI state
     */
    selectSeedIdx(state, payload) {
        state.currentSeedsIdx[payload.morphology] = payload.index;
        return state;
    },

    /**
     * Adds the given morphology with the given policy seeds to the list of morphologies.
     * @param state {Object} - UI state
     * @param payload {{morphology: string, seeds: []}}
     * @return {Object} - UI state
     */
    addMorphology(state, payload) {
        state.morphologies.push(payload);
        // Sorts the list of morphologies in the lexicographic order according to the name of the morphology
        state.morphologies.sort(function(a, b){
            return a.morphology.localeCompare(b.morphology);
        });
        return state;
    },

    /**
     * Changes the active tab.
     * @param state {Object} - UI state
     * @param payload {string} - Name of the active tab
     * @return {Object} - UI state
     */
    switchTab(state, payload) {
        state.activeTab = payload;
        return state;
    },

    /**
     * Activates or deactivates the ground drawing mode.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawGround(state, payload){
        state.drawingModeState.drawing_ground = payload;
        state.drawingModeState.drawing_ceiling = false;
        state.drawingModeState.erasing = false;
        state.advancedOptionsState.assets.circle = false;
        return state;
    },

    /**
     * Activates or deactivates the ceiling drawing mode.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawCeiling(state, payload){
        state.drawingModeState.drawing_ground = false;
        state.drawingModeState.drawing_ceiling = payload;
        state.drawingModeState.erasing = false;
        state.advancedOptionsState.assets.circle = false;
        return state;
    },

    /**
     * Activates or deactivates the erasing mode.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    erase(state, payload){
        state.drawingModeState.drawing_ground = false;
        state.drawingModeState.drawing_ceiling = false;
        state.drawingModeState.erasing = payload;
        state.advancedOptionsState.assets.circle = false;
        return state;
    },

    /**
     *
     * @param state {Object} - UI state
     * @param payload
     * @return {Object} - UI state
     */
    drawCircle(state, payload){
        state.drawingModeState.drawing_ground = false;
        state.drawingModeState.drawing_ceiling = false;
        state.drawingModeState.erasing = false;
        state.advancedOptionsState.assets.circle = payload;
        return state;
    },

    /**
     * Deactivates all drawing and erasing modes.
     * @param state {Object} - UI state
     * @param payload {}
     * @return {Object} - UI state
     */
    deselectDrawingButtons(state, payload){
        state.drawingModeState.drawing_ground = false;
        state.drawingModeState.drawing_ceiling = false;
        state.drawingModeState.erasing = false;
        state.advancedOptionsState.assets.circle = false;
        return state;
    },

    /**
     * Clears the drawing canvas and resets the drawing mode variables.
     * @param state {Object} - UI state
     * @param payload
     * @return {Object} - UI state
     */
    clear(state, payload){

        drawing_canvas.clear();
        window.ground = [];
        window.ceiling = [];
        window.terrain = {
            ground: [],
            ceiling: []
        };
        return state;
    },

    /**
     * Generates the terrain from the drawing (true) or vice-versa (false).
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    generateTerrain(state, payload){

        state.drawingModeState.drawing = !payload;
        state.simulationState.status = 'init';

        // Generates the terrain from the shapes drawn
        if(payload) {

            // Horizontally sorts the ground points that have been drawn
            window.terrain.ground.sort(function (a, b) {
                return a.x - b.x;
            });
            window.ground = [...window.terrain.ground];

            // Horizontally sorts the ceiling points that have been drawn
            window.terrain.ceiling.sort(function (a, b) {
                return a.x - b.x;
            });
            window.ceiling = [...window.terrain.ceiling];

            // Updates terrain alignment
            window.align_terrain = {
                align: false, // no alignment
                ceiling_offset: window.ceiling.length > 0 ? window.game.env.ceiling_offset - window.ceiling[0].y : null,
                ground_offset: window.ground.length > 0 ? window.ground[0].y : null, // first ground y value
                smoothing: window.game.env.TERRAIN_CPPN_SCALE // current smoothing
            };

            let terrainConfig = state.parkourConfig.terrain;
            let creepersConfig = state.parkourConfig.creepers;
            init_game(
                [terrainConfig.dim1, terrainConfig.dim2, terrainConfig.dim3],
                terrainConfig.waterLevel,
                creepersConfig.width,
                creepersConfig.height,
                creepersConfig.spacing,
                terrainConfig.smoothing,
                creepersConfig.type == 'Swingable',
                window.ground,
                window.ceiling,
                window.align_terrain,
                window.game.env.zoom,
                window.game.env.scroll
            );
        }

        // Generates the drawing from the terrain
        else {

            // Draws the forbidden red area on the forbidden canvas
            window.draw_forbidden_area();

            // Clears the previous drawing
            drawing_canvas.clear();
            window.terrain = {
                ground: [],
                ceiling: []
            };

            // Draws the shape of the current ground
            if(window.ground.length > 0){

                for(let i = 0; i < window.ground.length - 1; i++){
                    let p = window.ground[i];
                    let p2 = window.ground[i + 1];
                    let p_pos = convertPosEnvToCanvas(p.x, p.y);
                    let p2_pos = convertPosEnvToCanvas(p2.x, p2.y);

                    drawing_canvas.stroke("#66994D");
                    drawing_canvas.strokeWeight(4);
                    drawing_canvas.line(
                        p_pos.x,
                        p_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1],
                        p2_pos.x,
                        p2_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1]
                    )

                    window.terrain.ground.push({x: p.x, y: p.y});
                }
                let p = window.ground[window.ground.length - 1];
                window.terrain.ground.push({x: p.x, y: p.y});
            }

            // Draws the shape of the current ceiling
            if(window.ceiling.length > 0){

                for(let i = 0; i < window.ceiling.length - 1; i++){
                    let p = window.ceiling[i];
                    let p2 = window.ceiling[i + 1];
                    let p_pos = convertPosEnvToCanvas(p.x, p.y);
                    let p2_pos = convertPosEnvToCanvas(p2.x, p2.y);

                    drawing_canvas.stroke("#808080");
                    drawing_canvas.strokeWeight(4);
                    drawing_canvas.line(
                        p_pos.x,
                        p_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1],
                        p2_pos.x,
                        p2_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1]
                    )

                    window.terrain.ceiling.push({x: p.x, y: p.y});
                }
                let p = window.ceiling[window.ceiling.length - 1];
                window.terrain.ceiling.push({x: p.x, y: p.y});
            }

            // Empties the ground and ceiling lists of points to create an empty environment with just the startpad.
            window.ground = [];
            window.ceiling = [];

            // Initializes the environment
            let terrainConfig = state.parkourConfig.terrain;
            let creepersConfig = state.parkourConfig.creepers;
            init_game(
                [terrainConfig.dim1, terrainConfig.dim2, terrainConfig.dim3],
                terrainConfig.waterLevel,
                creepersConfig.width,
                creepersConfig.height,
                creepersConfig.spacing,
                terrainConfig.smoothing,
                creepersConfig.type == 'Swingable',
                window.ground,
                window.ceiling,
                window.align_terrain,
                window.game.env.zoom,
                window.game.env.scroll
            );

            // Displays the drawing and forbidden canvas on top of the main canvas
            image(drawing_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
            image(forbidden_canvas, 0, -SCROLL_Y_MAX + window.game.env.scroll[1]);
        }
        return state;
    },

    /**
     * Re-draws the terrain shapes on the drawing canvas.
     * @param state {Object} - UI state
     * @param payload
     * @return {Object} - UI state
     */
    refreshDrawing(state, payload){

        // Draws the forbidden red area on the forbidden canvas
        window.draw_forbidden_area();

        drawing_canvas.clear();

        // Horizontally sorts the ground points that have been drawn
        window.terrain.ground.sort(function (a, b) {
            return a.x - b.x;
        });

        // Horizontally sorts the ceiling points that have been drawn
        window.terrain.ceiling.sort(function (a, b) {
            return a.x - b.x;
        });

        // Draws the ground ground
        for(let i = 0; i < window.terrain.ground.length - 1; i++) {
            let p = window.terrain.ground[i];
            let p2 = window.terrain.ground[i + 1];
            let p_pos = convertPosEnvToCanvas(p.x, p.y);
            let p2_pos = convertPosEnvToCanvas(p2.x, p2.y);

            drawing_canvas.stroke("#66994D");
            drawing_canvas.strokeWeight(4);
            drawing_canvas.line(
                p_pos.x,
                p_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1],
                p2_pos.x,
                p2_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1]
            )
        }

        // Draws the ceiling
        for(let i = 0; i < window.terrain.ceiling.length - 1; i++) {
            let p = window.terrain.ceiling[i];
            let p2 = window.terrain.ceiling[i + 1];
            let p_pos = convertPosEnvToCanvas(p.x, p.y);
            let p2_pos = convertPosEnvToCanvas(p2.x, p2.y);

            drawing_canvas.stroke("#808080");
            drawing_canvas.strokeWeight(4);
            drawing_canvas.line(
                p_pos.x,
                p_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1],
                p2_pos.x,
                p2_pos.y + SCROLL_Y_MAX - window.game.env.scroll[1]
            )
        }

        return state;
    },

    /**
     * Draws or not all the joints of the environment and renders it.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawJoints(state, payload) {
        state.advancedOptionsState.drawJoints = payload;
        window.draw_joints = payload;
        window.game.env.render();
        return state;
    },

    /**
     * Draws or not all the lidars of the agents of the environment and renders it.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawLidars(state, payload) {
        state.advancedOptionsState.drawLidars = payload;
        window.draw_lidars = payload;
        window.game.env.render();
        return state;
    },

    /**
     * Draws or not all the names of the agents of the environment and renders it.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawNames(state, payload) {
        state.advancedOptionsState.drawNames = payload;
        window.draw_names = payload;
        window.game.env.render();
        return state;
    },

    /**
     * Draws or not the observation of the agents of the environment and renders it.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawObservation(state, payload) {
        state.advancedOptionsState.drawObservation = payload;
        window.draw_observation = payload;
        window.game.env.render();
        return state;
    },

    /**
     * Draws or not the reward of the agents of the environment and renders it.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    drawReward(state, payload) {
        state.advancedOptionsState.drawReward = payload;
        window.draw_reward = payload;
        window.game.env.render();
        return state;
    },

    /**
     * Starts (true) or exits (false) intro tour.
     * @param state {Object} - UI state
     * @param payload {boolean}
     * @return {Object} - UI state
     */
    setIntroTour(state, payload){
        state.simulationState.intro_tour = payload;

        // Shows the intro hints when exiting the guide tour
        if(!payload){
            window.introTour.addHints();
        }
        return state;
    },

    /**
     * Sets the language.
     * @param state {Object} - UI state
     * @param payload {string}
     * @return {Object} - UI state
     */
    setLanguage(state, payload) {
        state.language = payload;
        return state;
    }
};