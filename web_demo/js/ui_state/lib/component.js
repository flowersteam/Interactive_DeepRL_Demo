import Store from '../store/store.js';

/**
 * @classdesc Abstract class for UI components.
 */
export default class Component {

    /**
     * @constructor
     * @param props {{store: Store, element: HTMLElement, eventName: string}}
     */
    constructor(props = {}) {
        this.render = this.render || function () { };

        // Adds props.eventName with this.render() as callback function to the list of events handled by the UI state manager
        if (props.store instanceof Store) {
            props.store.events.subscribe(props.eventName, () => this.render());
        }
        if (props.hasOwnProperty('element')) {
            this.element = props.element;
        }
    }
}