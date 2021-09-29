import Component from '../lib/component.js';
import store from '../store/index.js';

const thumbnails_path = "images/agents_thumbnails/";

/**
 * @classdesc UI component for the list of morphologies.
 */
export default class MorphologiesList extends Component {

    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.querySelector('#agents-selection'),
            eventName: 'morphologiesChange'
        });
    }

    /**
     * Renders the list of morphologies and adds event listeners for the different elements.
     */
    render() {

        let dict = window.lang_dict[store.state.language]['morphologies'];

        this.element.querySelector('#agents-selection-title').innerHTML = dict['title'];
        this.element.querySelector('#agents-selection-text').innerText = dict['text'];

        this.element.querySelector('#morphologies-list').innerHTML = store.state.morphologies.map(m => {
            // Creates a list item for each morphology
            return `<li name="morph-list-item" class="list-group-item d-flex justify-content-between align-items-center px-0 my-1">

                        <div class="row align-items-center w-100">
                            <div class="col-4">
                                <!-- Thumbnail of the morphology -->
                                <img name="morphology_thumbnail" src=${thumbnails_path + m.morphology + "_thumbnail.png"} 
                                 alt=${m.morphology + "_thumbnail"} data-bs-toggle="tooltip" title="${dict[m.morphology]['description']}">
                            </div>
                            
                            <div class="col px-0">
                                <!-- Name of the morpholgy -->
                                <label for="morphology_thumbnail"><strong>${dict[m.morphology]['title']}</strong></label>
                                
                                <!-- Dropdown policy selector and add button -->                          
                                <div name="select_button" class="input-group mt-1">                       
                                    <select name="policies" class="form-select" data-bs-toggle="tooltip" title="${dict['policySelectTooltip']}"></select>
                                    <div class="input-group-append">
                                        <button name="addAgentButton" class="btn btn-warning"
                                        data-bs-toggle="tooltip" title="${dict['addBtnTooltip']}"><i class="fas fa-plus"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>`
        }).join('');

        // Renders the list items differently when drawing
        if (store.state.drawingModeState.drawing) {
            this.element.querySelectorAll('li[name="morph-list-item"]').forEach((span, index) => {
                span.classList.add('disabled');
            });
        }

        /* EVENT LISTENERS */

        // Adds all the compatible policies as options to the dropdown
        this.element.querySelectorAll('select[name="policies"]').forEach((span, index) => {

            // Dict that contains HTML code for each optgroup corresponding to each agent name
            let seed_names = {};

            store.state.morphologies
                .filter(m => m.morphology == store.state.morphologies[index].morphology)
                .flatMap(morphology => morphology.seeds)
                .map((seedEntry, idx) => {

                    // Splits seed name between name and age
                    let seed = seedEntry.name.split('/');
                    let name = seed[0];
                    let age = seed[1];

                    // Adds options and optgroups
                    if(seed_names.hasOwnProperty(name)){
                        seed_names[name] += `<option value="${seedEntry.path}">${name + " (" + dict[age] + ")"}</option>`;

                    }
                    else {
                        seed_names[name] = `<optgroup label=${name}>
                                                <option value="${seedEntry.path}">${name + " (" + dict[age] + ")"}</option>`;
                    }
                });
            let options = [];
            for(let name in seed_names){
                seed_names[name] += `</optgroup>`;
                options.push(seed_names[name]);
            }
            span.innerHTML = options.join(``);

            // Selects a policy option
            span.addEventListener('input', evt => {
                store.dispatch('selectSeedIdx', {morphology: store.state.morphologies[index].morphology, index: span.selectedIndex});
            });

            span.selectedIndex = store.state.currentSeedsIdx[store.state.morphologies[index].morphology];
        });

        // Adds an agent to the environment with the corresponding morphology and the current policy selected
        this.element.querySelectorAll('button[name="addAgentButton"]').forEach((span, index) => {
            span.addEventListener('click', () => {
                let morph = store.state.morphologies[index];
                let seed = morph.seeds[store.state.currentSeedsIdx[morph.morphology]].name.split('/');
                store.dispatch('addAgent', {
                    morphology: morph.morphology,
                    name: seed[0],
                    age: seed[1],
                    path: morph.seeds[store.state.currentSeedsIdx[morph.morphology]].path,
                    init_pos: null
                });
            });
        });

        /* Initializes tooltips */
        this.element.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((el, index) => {
            return new bootstrap.Tooltip(el, {
                trigger: 'hover'
            });
        });
    }
};