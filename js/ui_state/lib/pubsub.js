/**
 * @classdesc UI state manager.
 */
export default class PubSub {
    /**
     * @constructor
     */
    constructor() {
        this.events = {};
    }

    /**
     * Adds the given callback function to the given event and adds the event to the handled events if it is not in it yet.
     * @param event {string}
     * @param callback {function}
     * @return {number}
     */
    subscribe(event, callback) {
        if (!this.events.hasOwnProperty(event)) {
            this.events[event] = [];
        }
        return this.events[event].push(callback);
    }

    /**
     * Triggers all the callback functions for the given event.
     * @param event {string}
     * @param data
     * @return {*[]|*}
     */
    publish(event, data = {}) {
        if (!this.events.hasOwnProperty(event)) {
            return [];
        }
        return this.events[event].map(callback => callback(data));
    }
}