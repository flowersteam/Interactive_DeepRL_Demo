import Component from '../lib/component.js';
import store from '../store/index.js';

/**
 * @classdesc UI component for global elements.
 */
export default class GlobalElements extends Component{

    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.body,
            eventName: 'globalElementsChange'
        });
    }

    /**
     * Renders the global UI elements.
     */
    render() {
        let dict = window.lang_dict[store.state.language]['globalElements'];

        // Title
        this.element.querySelector('#demoTitle').innerText = dict['demoTitle'];

        // Tabs buttons
        this.element.querySelector('#getting-started-btn').innerText = dict['gettingStarted'];
        this.element.querySelector('#parkour-custom-btn').innerText = dict['parkourCustomization'];
        this.element.querySelector('#advanced-options-btn').innerText = dict['advancedOptions'];
        this.element.querySelector('#about-btn').innerHTML = `<i class="fas fa-info-circle fa-lg"></i> ${dict['about']}`;

        // Changes the selected index of the language dropdown
        this.element.querySelector('#langSelect').selectedIndex = store.state.language == 'EN' ? 0 : 1;

        // Save env modal
        let modal = this.element.querySelector('#saveEnvModal');
        modal.querySelector('#save-modal-title').innerHTML = dict['saveEnvModal']['title'];
        modal.querySelector('#save-modal-text').innerText = dict['saveEnvModal']['text'];
        modal.querySelector('#env-name-label').innerText = dict['saveEnvModal']['nameLabel'];
        modal.querySelector('#env-description-label').innerText = dict['saveEnvModal']['descriptionLabel'];
        modal.querySelector('#save-cancel-btn').innerText = dict['saveEnvModal']['cancelBtn'];
        modal.querySelector('#save-confirm-btn').innerText = dict['saveEnvModal']['confirmBtn'];
    }
};