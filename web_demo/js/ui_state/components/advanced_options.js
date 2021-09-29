import Component from '../lib/component.js';
import store from '../store/index.js';

/**
 * @classdesc UI component for advanced options.
 */
export default class AdvancedOptions extends Component {

    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.querySelector('#advancedOptions'),
            eventName: 'advancedOptionsChange'
        });
    }

    /**
     * Renders the advanced options UI elements.
     */
    render() {

        const state = store.state.advancedOptionsState;

        let dict = window.lang_dict[store.state.language]['advancedOptions'];

        /* Rendering Options */
        this.element.querySelector('#renderingOptionsTitle').innerHTML = dict['renderingOptions'];


        let drawJointsSwitch = this.element.querySelector('#drawJointsSwitch');
        let drawLidarsSwitch = this.element.querySelector('#drawLidarsSwitch');
        let drawNamesSwitch = this.element.querySelector('#drawNamesSwitch');
        let drawObservationSwitch = this.element.querySelector('#drawObservationSwitch');
        let drawRewardSwitch = this.element.querySelector('#drawRewardSwitch');

        // Checks the draw switches
        drawJointsSwitch.checked = state.drawJoints;
        drawLidarsSwitch.checked = state.drawLidars;
        drawNamesSwitch.checked = state.drawNames;
        drawObservationSwitch.checked = state.drawObservation;
        drawRewardSwitch.checked = state.drawReward;

        // Tooltips
        drawJointsSwitch.title = dict['drawJointsTooltip'];
        drawLidarsSwitch.title = dict['drawLidarsTooltip'];
        drawNamesSwitch.title = dict['drawNamesTooltip'];
        drawObservationSwitch.title = dict['drawObservationTooltip'];
        drawRewardSwitch.title = dict['drawRewardTooltip'];

        // Switches labels
        this.element.querySelector('#drawJointsLabel').innerText = dict['drawJoints'];
        this.element.querySelector('#drawLidarsLabel').innerText = dict['drawLidars'];
        this.element.querySelector('#drawNamesLabel').innerText = dict['drawNames'];
        this.element.querySelector('#drawObservationLabel').innerText = dict['drawObservation'];
        this.element.querySelector('#drawRewardLabel').innerText = dict['drawReward'];

        /* Assets */

        this.element.querySelector('#assetsTitle').innerHTML = dict['assetsTitle'];
        this.element.querySelector('#assetsText').innerText = dict['assetsText'];
        this.element.querySelector('#comingSoon').innerText = dict['comingSoon'];

        // Renders the assets buttons
        let circleAssetButton = this.element.querySelector('#circleAssetButton');
        circleAssetButton.innerHTML = dict['circle'];
        if(state.assets.circle){
            circleAssetButton.className = "btn btn-asset";
        }
        else{
            circleAssetButton.className = "btn btn-outline-asset";
        }

        /* Initializes tooltips */
        this.element.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((el, index) => {
            return new bootstrap.Tooltip(el, {
                trigger: 'hover'
            });
        });
    }
};