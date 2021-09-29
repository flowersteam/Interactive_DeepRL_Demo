import Component from '../lib/component.js';
import store from '../store/index.js';

/**
 * @classdesc UI component for the parkour parameters.
 */
export default class ParkourConfig extends Component {

    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.querySelector('#parkour-custom-tab'),
            eventName: 'parkourConfigChange'
        });
    }

    /**
     * Renders the parkour parameters.
     */
    render() {

        // TERRAIN CONFIG
        const terrainConfig = store.state.parkourConfig.terrain;
        let dict = window.lang_dict[store.state.language]['parkourConfig'];

        // Sections titles
        this.element.querySelector('#terrain-generation-title').innerHTML = dict['terrainGeneration'];
        this.element.querySelector('#general-parameters-title').innerText = dict['generalParameters'];
        this.element.querySelector('#creepers-title').innerText = dict['creepers'];

        // Terrain generation tabs buttons
        this.element.querySelector('#draw-tab-btn').innerText = dict['drawTabBtn'];
        this.element.querySelector('#proc-gen-tab-btn').innerText = dict['procGenTabBtn'];

        // Procedural Generation text
        this.element.querySelector('#proc-gen-text').innerHTML = dict['procGenText'];

        // Parameters labels
        this.element.querySelector('#smoothing-label').innerText = dict['smoothing'];
        this.element.querySelector('#water-level-label').innerText = dict['waterLevel'];
        this.element.querySelector('#creepers-width-label').innerText = dict['creepersWidth'];
        this.element.querySelector('#creepers-height-label').innerText = dict['creepersHeight'];
        this.element.querySelector('#creepers-spacing-label').innerText = dict['creepersSpacing'];
        //this.element.querySelector('#creepers-type-label').innerText = dict['creepersType'];

        this.element.querySelector('#rigid-otpion').innerText = dict['rigid'];
        this.element.querySelector('#swingable-option').innerText = dict['swingable'];

        // Sliders values
        this.element.querySelector("#dim1Slider").value = terrainConfig.dim1;
        this.element.querySelector("#dim2Slider").value = terrainConfig.dim2;
        this.element.querySelector("#dim3Slider").value = terrainConfig.dim3;
        this.element.querySelector("#smoothingSlider").value = terrainConfig.smoothing;
        this.element.querySelector("#waterSlider").value = terrainConfig.waterLevel;

        // Sliders text values
        this.element.querySelector("#dim1Value").innerText = terrainConfig.dim1;
        this.element.querySelector("#dim2Value").innerText = terrainConfig.dim2;
        this.element.querySelector("#dim3Value").innerText = terrainConfig.dim3;
        this.element.querySelector("#smoothingValue").innerText = terrainConfig.smoothing;
        this.element.querySelector("#waterValue").innerText = terrainConfig.waterLevel;

        // CREEPERS CONFIG
        const creepersConfig = store.state.parkourConfig.creepers;

        this.element.querySelector("#creepersWidthSlider").value = creepersConfig.width;
        this.element.querySelector("#creepersHeightSlider").value = creepersConfig.height;
        this.element.querySelector("#creepersSpacingSlider").value = creepersConfig.spacing;

        this.element.querySelector("#creepersWidthValue").innerText = creepersConfig.width;
        this.element.querySelector("#creepersHeightValue").innerText = creepersConfig.height;
        this.element.querySelector("#creepersSpacingValue").innerText = creepersConfig.spacing;

        this.element.querySelector("#creepersType").value = creepersConfig.type;
    }
};