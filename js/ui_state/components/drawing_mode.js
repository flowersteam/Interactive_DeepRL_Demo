import Component from '../lib/component.js';
import store from '../store/index.js';

/**
 * @classdesc UI component for the drawing mode buttons.
 */
export default class DrawingMode extends Component {
    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.querySelector('#draw-tab'),
            eventName: 'drawingModeChange'
        });
    }

    /**
     * Renders the drawing mode buttons.
     */
    render() {
        const state = store.state.drawingModeState;
        const dict = window.lang_dict[store.state.language]['drawingMode'];

        let drawGroundButton = this.element.querySelector('#drawGroundButton');
        let drawCeilingButton = this.element.querySelector('#drawCeilingButton');
        let eraseButton = this.element.querySelector('#eraseButton');
        let clearButton = this.element.querySelector('#clearButton');
        let generateTerrainButton = this.element.querySelector('#generateTerrainButton');

        this.element.querySelector('#drawingIntro').innerHTML = dict['intro'];
        this.element.querySelector('#drawingText').innerHTML = dict['text'];

        drawGroundButton.innerHTML = `<i class="fas fa-pencil-alt"></i> ${dict['ground']}`;
        drawCeilingButton.innerHTML = `<i class="fas fa-pencil-alt"></i> ${dict['ceiling']}`;
        eraseButton.innerHTML = `<i class="fas fa-eraser"></i> ${dict['erase']}`;
        clearButton.innerHTML = `<i class="fas fa-times"></i> ${dict['clear']}`;

        // Enables the buttons when drawing mode is active
        if(state.drawing){

            drawGroundButton.className = "btn btn-outline-success";
            drawCeilingButton.className = "btn btn-outline-secondary";
            eraseButton.className = "btn btn-outline-warning";

            // Fills the button corresponding to the current drawing mode
            if(state.drawing_ground){
                drawGroundButton.className = "btn btn-success";
            }
            else if(state.drawing_ceiling){
                drawCeilingButton.className = "btn btn-secondary";
            }
            else if(state.erasing){
                eraseButton.className = "btn btn-warning";
            }

            generateTerrainButton.className = "btn btn-success";
            generateTerrainButton.innerText = dict['generateTerrain'];
        }

        // Disables drawing buttons when drawing mode is inactive
        else{
            drawGroundButton.className = "btn btn-outline-success disabled";
            drawCeilingButton.className = "btn btn-outline-secondary disabled";
            eraseButton.className = "btn btn-outline-warning disabled";

            generateTerrainButton.className = "btn btn-primary";
            generateTerrainButton.innerText = dict['draw'];
        }
    }
};