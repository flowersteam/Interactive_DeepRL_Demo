import Component from '../lib/component.js';
import store from '../store/index.js';

/**
 * @classdesc UI component for "About..." tab.
 */
export default class AboutTab extends Component {

    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.querySelector('#about-tab'),
            eventName: 'aboutTabChange'
        });
    }

    /**
     * Renders the global UI elements.
     */
    render() {
        let dict = window.lang_dict[store.state.language]['aboutTab'];

        // Purpose section
        this.element.querySelector('#purpose-title').innerHTML = dict['purposeTitle'];
        this.element.querySelector('#purpose-text').innerHTML = dict['purposeText'];

        // RL section
        this.element.querySelector('#rl-title').innerHTML = dict['rlTitle'];
        this.element.querySelector('#rl-text').innerHTML = dict['rlText'];

        // DRL section
        this.element.querySelector('#drl-title').innerHTML = dict['drlTitle'];
        this.element.querySelector('#drl-text').innerHTML = dict['drlText'];

        // ACL section
        this.element.querySelector('#acl-title').innerHTML = dict['aclTitle'];
        this.element.querySelector('#acl-text').innerHTML = dict['aclText'];

        // About demo section
        this.element.querySelector('#about-demo-title').innerHTML = dict['aboutDemoTitle'];
        this.element.querySelector('#about-demo-text').innerHTML = dict['aboutDemoText'];

        // Credits section
        this.element.querySelector('#credits-title').innerHTML = dict['creditsTitle'];
        this.element.querySelector('#credits-text').innerHTML = dict['creditsText'];

        // References section
        this.element.querySelector('#references-title').innerHTML = dict['referencesTitle'];
        this.element.querySelector('#references-text').innerHTML = dict['referencesText'];
    }
};