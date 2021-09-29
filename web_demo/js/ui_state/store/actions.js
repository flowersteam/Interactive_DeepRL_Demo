// All available actions
export default {

    /**
     * Adds the given environment to the specified set.
     * @param context {Store}
     * @param payload {{set: string, env: Object}}
     */
    addEnv(context, payload){
        context.commit('addEnv', payload);
    },

    /**
     * Removes the environment of the given index from the custom set.
     * @param context {Store}
     * @param payload {number} - Index of the environment to remove
     */
    deleteEnv(context, payload){
        context.commit('deleteEnv', payload);
    },

    /**
     * Loads the given environment into the simulation.
     * @param context {Store}
     * @param payload {Object} - Environment to load
     */
    loadEnv(context, payload){

        // Resets drawing mode
        drawing_canvas.clear();
        window.terrain = {
            ground: [],
            ceiling: []
        };

        window.ground = [...payload.terrain.ground];
        window.ceiling = [...payload.terrain.ceiling];

        // Updates the values of the terrain sliders
        for(let param in payload.terrain.parkourConfig){
            context.commit('updateParkourConfig', {name: param, value: payload.terrain.parkourConfig[param]});
        }
        for(let param in payload.terrain.creepersConfig){
            context.commit('updateParkourConfig', {name: param, value: payload.terrain.creepersConfig[param]});
        }

        // Replaces previous agents by the ones of the env
        while (context.state.agents.length > 0){
            context.commit('deleteAgent', {index: 0});
        }
        for(let agent of payload.agents){
            context.commit('addAgent', {
                morphology: agent.morphology,
                name: agent.name,
                age: agent.age,
                path: agent.path,
                init_pos: agent.init_pos
            });
        }

        // Initializes the new environment
        context.commit('init_default', {});
    },

    /**
     * Initializes the game with default parameters.
     * @param context {Store}
     * @param payload
     */
    init_default(context, payload) {
        context.commit('init_default', {});
    },

    /**
     * Changes the value of the given terrain parameter.
     * @param context {Store}
     * @param payload {{name: string, value: number}} - Name and value of the terrain parameter to change
     */
    changeParkourConfig(context, payload){

        // Case one of the cppn dims is changed : aligns the terrain with the startpad
        if(['dim1', 'dim2', 'dim3'].indexOf(payload.name) != -1){

            window.ground = [];
            window.ceiling = [];
            window.align_terrain = {
                align: true,
                ceiling_offset: null, // aligns the ceiling with the startpad
                ground_offset: null, // aligns the ground with the startpad
                smoothing: window.game.env.TERRAIN_CPPN_SCALE // previous smoothing
            };
        }
        // Case smoothing, water_level or creepers is changed
        else{
            window.align_terrain = {
                align: true,
                ceiling_offset: window.align_terrain.ceiling_offset, // keeps the same
                ground_offset: window.align_terrain.ground_offset, // keeps the same
                smoothing: window.game.env.TERRAIN_CPPN_SCALE // previous smoothing
            };
        }

        // Updates the parameter
        context.commit('updateParkourConfig', payload);

        // Generates the terrain if drawing mode is active
        if(context.state.drawingModeState.drawing){
            context.commit('generateTerrain', true);
        }

        // Resets drawing mode
        drawing_canvas.clear();
        window.terrain = {
            ground: [],
            ceiling: []
        };

        // Resets the simulation and deselects agent
        context.commit('resetSimulation', {keepPositions: true});
        context.commit('selectAgent', -1);
    },

    /**
     * Changes the value of the given switch parameter.
     * @param context {Store}
     * @param payload {{name: string, value: number}} - Name and value of the switch to toggle
     */
    toggleSwitch(context, payload) {
        switch (payload.name) {
            case 'drawJoints':
                context.commit('drawJoints', payload.value);
                break;
            case 'drawLidars':
                context.commit('drawLidars', payload.value);
                break;
            case 'drawNames':
                context.commit('drawNames', payload.value);
                break;
            case 'drawObservation':
                context.commit('drawObservation', payload.value);
                break;
            case 'drawReward':
                context.commit('drawReward', payload.value);
                break;
        }
    },

    /**
     * Changes the status of the simulation.
     * @param context {Store}
     * @param payload {}
     */
    toggleRun(context, payload) {
        const status = context.state.simulationState.status;
        switch (status) {
            case 'init':
                context.commit('startSimulation', {});
                break;
            case 'running':
                context.commit('pauseSimulation', {});
                break;
            case 'paused':
                context.commit('startSimulation', {});
                break;
        }
    },

    /**
     * Resets the simulation.
     * @param context {Store}
     * @param payload {}
     */
    resetSimulation(context, payload) {
        // Updates the terrain alignment
        window.align_terrain = {
            align: true, // aligns the terrain with the startpad
            ceiling_offset: window.ceiling.length > 0 ? window.game.env.ceiling_offset - window.ceiling[0].y : null,
            ground_offset: window.ground.length > 0 ? window.ground[0].y : null, // first ground y value
            smoothing: window.game.env.TERRAIN_CPPN_SCALE // smoothing of the current terrain
        };

        context.commit('selectAgent', {index: -1});
        context.commit('resetSimulation', {keepPositions: false});
    },

    /**
     * Adds the given agent to the simulation.
     * @param context {Store}
     * @param payload {{morphology: string, name: string, path: string, init_pos: {x: number, y: number}}}
     */
    addAgent(context, payload) {
        // Pauses the simulation if it is running
        if (context.state.simulationState.status == 'running') {
            context.commit('pauseSimulation', {});
        }
        context.commit('addAgent', payload);
    },

    /**
     * Deletes the agent of the given index from the simulation.
     * @param context {Store}
     * @param payload {{index: number}}
     */
    deleteAgent(context, payload) {
        context.commit('deleteAgent', payload);
    },

    /**
     * Sets the initial position of the agent of the given index.
     * @param context {Store}
     * @param payload {{index: number, init_pos: {x: number, y: number}}}
     */
    setAgentInitPos(context, payload){
        context.commit('setAgentInitPos', payload);
    },

    /**
     * Selects the agent of the given index.
     * @param context {Store}
     * @param payload {{index: number}}
     */
    selectAgent(context, payload){
        context.commit('selectAgent', payload);
    },

    /**
     * Follows or not the agent of the given index according to the given boolean.
     * @param context {Store}
     * @param payload {{index: number, value: boolean}}
     */
    followAgent(context, payload) {
        context.commit('followAgent', payload);
    },

    /**
     * Renames the agent of the given index with the given string value.
     * @param context {Store}
     * @param payload {{index: number, value: string}}
     */
    renameAgent(context, payload){
        context.commit('renameAgent', payload);
    },

    /**
     * Selects the seed option of the given index for the given morphology.
     * @param context {Store}
     * @param payload {{morphology: string, index: number}}
     */
    selectSeedIdx(context, payload) {
        context.commit('selectSeedIdx', payload);
    },

    /**
     * Adds the given morphology with the given policy seeds to the list of morphologies.
     * @param context {Store}
     * @param payload {{morphology: string, seeds: []}}
     */
    addMorphology(context, payload) {
        context.commit('addMorphology', payload);
        // Selects the first seed option
        context.commit('selectSeedIdx', {morphology: payload.morphology, index: 0});
    },

    /**
     * Changes the active tab.
     * @param context {Store}
     * @param payload {string} - Name of the tab to activate
     */
    switchTab(context, payload) {

        // Switch from 'Draw Yourself!' to another tab
        if(context.state.activeTab == 'draw_yourself'){
            if(payload != 'draw_yourself' && context.state.drawingModeState.drawing) {
                // Generates the terrain from the drawing
                context.commit('generateTerrain', true);
            }
        }
        // Switch to 'Draw Yourself!' from another tab
        else if(payload == 'draw_yourself'){
            // Generates the drawing from the terrain
            context.commit('generateTerrain', false);
        }
        context.commit('switchTab', payload);
    },

    /**
     * Activates or deactivates the ground drawing mode.
     * @param context {Store}
     * @param payload {boolean}
     */
    drawGround(context, payload) {
        context.commit('drawGround', payload);
    },

    /**
     * Activates or deactivates the ceiling drawing mode.
     * @param context {Store}
     * @param payload {boolean}
     */
    drawCeiling(context, payload) {
        context.commit('drawCeiling', payload);
    },

    /**
     * Activates or deactivates the erasing mode.
     * @param context {Store}
     * @param payload {boolean}
     */
    erase(context, payload) {
        context.commit('erase', payload);
    },

    /**
     * Activates or deactivates the drawing mode of the given asset.
     * @param context {Store}
     * @param payload {{name: string, value: boolean}}
     */
    drawAsset(context, payload){
        // Only supports circle asset for now
        switch (payload.name){
            case 'circle':
                context.commit('drawCircle', payload.value);
                break;
        }
    },

    /**
     * Handles clicks outside the canvas when drawing.
     * @param context {Store}
     * @param payload {}
     */
    deselectDrawingButtons(context, payload){
        context.commit('deselectDrawingButtons', payload);
    },

    /**
     * Resets drawing mode.
     * @param context {Store}
     * @param payload {}
     */
    clear(context, payload) {
        context.commit('clear', payload);
        context.commit('generateTerrain', false);
    },

    /**
     * Generates the terrain from the drawing (true) or vice-versa (false).
     * @param context {Store}
     * @param payload {boolean}
     */
    generateTerrain(context, payload){
        context.commit('generateTerrain', payload);
    },

    refreshDrawing(context, payload){
        context.commit('refreshDrawing', payload);
    },

    /**
     * Starts (true) or exits (false) intro tour.
     * @param context {Store}
     * @param payload {boolean}
     */
    setIntroTour(context, payload){
        context.commit('setIntroTour', payload);
    },

    /**
     * Sets the language.
     * @param context {Store}
     * @param payload {string}
     */
    setLanguage(context, payload){
        context.commit('setLanguage', payload);

        // Resets the hints options of the intro
        if(window.introTour != null){
            window.introTour.setOptions({
                hintButtonLabel: window.lang_dict[context.state.language]['introHints']['buttonLabel'],
                hints: [
                    {
                        hint: window.lang_dict[context.state.language]['introHints']['tips'],
                        element: document.querySelector('#canvas_container'),
                        hintPosition: 'top-right',
                    }
                ]
            });

            // Removes the div element of the hints
            let introDiv = document.getElementsByClassName("introjs-hints")[0];
            introDiv.parentNode.removeChild(introDiv);

            // Recreates the hints
            window.introTour.addHints();
        }

        window.game.env.render();
    }
};