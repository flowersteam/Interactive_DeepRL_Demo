import PubSub from '../lib/pubsub.js';

/**
 * @classdesc Class that handles UI state modifications.
 */
export default class Store {
    /**
     * @constructor
     * @param params {{actions: {}, mutations: {}, state: {}}}
     */
    constructor(params) {
        let self = this;
        self.actions = {};
        self.mutations = {};
        self.state = {};
        self.status = 'default state';
        self.events = new PubSub(); // UI modifications manager
        if (params.hasOwnProperty('actions')) {
            self.actions = params.actions;
        }
        if (params.hasOwnProperty('mutations')) {
            self.mutations = params.mutations;
        }

        // Creates a Proxy to handles the state modifications
        self.state = new Proxy((params.state || {}), {

            /**
             * Function called when a key of the state is changed. Publish an event corresponding to the key that has been changed.
             * @param state {Object}
             * @param key {string}
             * @param value {}
             * @return {boolean}
             */
            set: function (state, key, value) {
                state[key] = value;
                console.log(`stateChange: ${key}: ${value}`);

                if(key == 'envsSets'){
                    self.events.publish('envsSetChange', self.state);
                }
                else if(key == 'morphologies'){
                    self.events.publish('morphologiesChange', self.state);
                }
                else if(key == 'agents'){
                    self.events.publish('agentsListChange', self.state);
                }
                else if(key == 'simulationState'){
                    self.events.publish('agentsListChange', self.state);
                    self.events.publish('mainButtonsChange', self.state);
                }
                else if(key == 'parkourConfig'){
                    self.events.publish('parkourConfigChange', self.state);
                }
                else if(key == 'drawingModeState'){
                    self.events.publish('drawingModeChange', self.state);
                }
                else if(key == 'advancedOptionsState'){
                    self.events.publish('advancedOptionsChange', self.state);
                }
                else if(key == 'language'){
                    self.events.publish('globalElementsChange', self.state);
                    self.events.publish('aboutTabChange', self.state);
                }

                if (self.status !== 'mutation') {
                    console.warn(`You should use a mutation to set ${key}`);
                }
                return true;
            }
        });
    }

    /**
     * Triggers the action specified by actionKey with the given payload.
     * @param actionKey {string}
     * @param payload
     * @return {boolean}
     */
    dispatch(actionKey, payload) {
        let self = this;
        if (typeof self.actions[actionKey] !== 'function') {
            console.error(`Action "${actionKey} doesn't exist.`);
            return false;
        }
        console.groupCollapsed(`ACTION: ${actionKey}`);
        self.status = 'action';
        self.actions[actionKey](self, payload);
        console.groupEnd();
        return true;
    }

    /**
     * Triggers the mutation specified by mutationKey with the given payload.
     * @param mutationKey
     * @param payload
     * @return {boolean}
     */
    commit(mutationKey, payload) {
        let self = this;
        if (typeof self.mutations[mutationKey] !== 'function') {
            console.log(`Mutation "${mutationKey}" doesn't exist`);
            return false;
        }
        self.status = 'mutation';
        let newState = self.mutations[mutationKey](self.state, payload);
        self.state = Object.assign(self.state, newState);
        self.status = 'resting';
        return true;
    }   
}