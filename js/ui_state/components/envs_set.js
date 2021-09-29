import Component from '../lib/component.js';
import store from '../store/index.js';

/**
 * @classdesc UI component for the sets of environments.
 */
export default class EnvsSet extends Component{

    /**
     * @constructor
     */
    constructor() {
        super({
            store,
            element: document.querySelector('#getting-started-tab'),
            eventName: 'envsSetChange'
        });
    }

    /**
     * Renders the sets of environments and adds event listeners to the different elements.
     */
    render(){
        let dict = window.lang_dict[store.state.language]['envsSets'];

        this.element.querySelector('#baseSetText').innerHTML = dict['baseSetText'];
        this.element.querySelector('#customSetText').innerHTML = dict['customSetText'];

        /* Base envs set */
        let baseEnvs = this.element.querySelector('#baseEnvsSet');

        baseEnvs.innerHTML = store.state.envsSets.baseEnvsSet.map(e => {
            // Creates a card for each environment in the base set
            return `<div class="col" name="env-set-item">
                        <div class="card bg-light h-100 btn p-0" name="env-card">
                        
                            <!-- Thumbnail of the environment -->
                            <img name="env_thumbnail" class="card-image-top" src=${e.image} alt=${e.description.name}>
                            
                            <!-- Name and description of the environment -->
                            <div class="card-body">
                                <h1 class="card-title"><strong>${e.description[store.state.language]['name']}</strong></h1>
                                <p class="card-text">${e.description[store.state.language]['text']}</p>
                            </div>
                        </div>
                    </div>`
        }).join('');

        /* Custom envs set */
        let customEnvs = this.element.querySelector('#customEnvsSet');

        // Creates a special card for uploading files
        let uploadCard = `<div class="col mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h1 class="card-title"><strong>${dict['uploadCard']['title']}</strong></h1>
                                    <p class="card-text">${dict['uploadCard']['text']}</p>
                                    <div class="input-group my-3">
                                        <input id="uploadEnvFile" type="file" class="custom-file-input" accept=".json">
                                    </div>
                                </div>                            
                                <div class="card-footer">
                                    <button id="uploadEnvBtn" class="btn btn-warning w-100" type="button"
                                    data-bs-toggle="tooltip" title="${dict['uploadCard']['uploadBtnTooltip']}">
                                    <i class="fas fa-upload"></i>
                                    </button>      
                                </div>
                            </div>
                        </div>`;

        let envCards = store.state.envsSets.customEnvsSet.map((e, index) => {
            // Creates a card for each environment in the custom set
            return `<div class="col mb-3" name="env-set-item">
                        <div class="card bg-light h-100 btn p-0" name="env-card">
                        
                            <!-- Thumbnail of the environment -->
                            <img name="env_thumbnail" class="card-image-top" src=${e.image} alt=${e.description.name}>
                            
                            <!-- Name and description of the environment -->
                            <div class="card-body">
                                <h1 class="card-title"><strong>${e.description.name}</strong></h1>
                                <p class="card-text">${e.description.text}</p>
                            </div>
                            
                            <!-- Download and delete buttons in the footer -->
                            <div class="card-footer justify-content-between">
                                <button name="downloadEnvBtn" class="btn btn-primary mx-1" type="button" data-bs-toggle="tooltip" title="${dict['downloadBtnTooltip']}">
                                <i class="fas fa-download"></i></button>
                                <button name="deleteEnvBtn" class="btn btn-danger mx-1" type="button" data-bs-toggle="tooltip" title="${dict['deleteBtnTooltip']}">
                                <i class="fa fa-trash"></i></button>
                            </div>  
                        </div>
                    </div>`
        }).join('');

        customEnvs.innerHTML = [uploadCard, envCards].join('');

        /* EVENT LISTENERS */

        // Loads a base environment
        baseEnvs.querySelectorAll('div[name="env-card"]').forEach((span, index) => {
            span.addEventListener('click', () => {
                store.dispatch('loadEnv', store.state.envsSets.baseEnvsSet[index]);
            })
        });

        // Loads a custom environment
        customEnvs.querySelectorAll('div[name="env-card"]').forEach((span, index) => {
            span.addEventListener('click', () => {
                store.dispatch('loadEnv', store.state.envsSets.customEnvsSet[index]);
            })
        });

        // Parses the uploaded file and adds the corresponding environment to the custom set
        customEnvs.querySelector('#uploadEnvBtn').addEventListener('click', () => {
            let reader = new FileReader();
            reader.addEventListener('load', () => {
                let env = JSON.parse(reader.result);
                store.dispatch('addEnv',{set: 'custom', env: env});
            });
            let file = customEnvs.querySelector('#uploadEnvFile').files[0];
            if(file != null){
                reader.readAsText(file);
            }
        });

        // Downloads a custom environment
        customEnvs.querySelectorAll('button[name="downloadEnvBtn"]').forEach((span, index) => {
            span.addEventListener('click', () => {
                downloadObjectAsJson(store.state.envsSets.customEnvsSet[index], store.state.envsSets.customEnvsSet[index].description.name.split(' ').join('_'));
            })
        });

        // Deletes a custom environment
        customEnvs.querySelectorAll('button[name="deleteEnvBtn"]').forEach((span, index) => {
            span.addEventListener('click', () => {
                store.dispatch('deleteEnv', index);
            })
        });

        /* Initializes tooltips */
        this.element.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((el, index) => {
            return new bootstrap.Tooltip(el, {
                trigger: 'hover'
            });
        });
    }
};