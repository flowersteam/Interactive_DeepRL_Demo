# Deep Reinforcement Learning Interactive Demo

This project aims at designing a popular science experiment in the form of an in-browser interactive demonstration in order to showcase the capabilities of Deep Reinforcement
Learning agents, including their ability to generalize to unknown tasks. The demonstration is available online [here](https://pgermon.github.io/teach_DRL_demo/).

## Organization of the repository

The repository is organized as follows:

📦 teach_DRL_demo  
┣ 📂 [`policy_models`] -- *policies available for each morphology in the TF SavedModel format*       
┣ 📂 [`web_demo`] -- *web app main folder*    
┃ ┣ 📂 [`base_envs_set`] -- *set of basic environments in JSON files*  
┃ ┣ 📂 [`images`] -- *graphics used in the demo*  
┃ ┣ 📂 [`js`] -- *source code*  
┃ ┃ ┣ 📂 [`bodies`] -- *code for agents morphologies*  
┃ ┃ ┣ 📂 [`Box2D_dynamics`] -- *collisions handlers*  
┃ ┃ ┣ 📂 [`CPPN`] -- *weights and code of the CPPN used to generate terrain*  
┃ ┃ ┣ 📂 [`envs`] -- *available environments*  
┃ ┃ ┣ 📂 [`ui_state`] -- *UI state management*  
┃ ┃ ┣ 📂 [`utils`] -- *utility classes and functions*  
┃ ┃ ┣ 📜 [`box2d.js`] -- *full box2d code*  
┃ ┃ ┣ 📜 [`draw_p5.js`] -- *rendering functions*  
┃ ┃ ┣ 📜 [`game.js`] -- *handles simulation execution*  
┃ ┃ ┗ 📜 [`i18n.js`] -- *handles internationalization*  
┃ ┣ 📜 [`index.html`]  
┃ ┣ 📜 [`index.js`]  
┃ ┣ 📜 [`ui.js`] -- *sets up the different UI elements*  
┃ ┗ 📜 [`demo.css`]   
┣ 📜 [`list_base_envs.py`] -- *python script used to generate a JSON file which lists all the files in [`base_envs_set`]*  
┗ 📜 [`policies_to_json.py`] -- *python script used to generate a JSON file which lists all the policies in [`policy_models`]*  

## Installation

Follow these steps if you want to launch the demo locally.

**1. Get the repository**
```
git clone https://github.com/pgermon/teach_DRL_demo.git
cd teach_DRL_demo/
```

**2. Install it, using Conda for example (use Python >= 3.6)**
```
conda create --name DRLdemo python=3.6
conda activate DRLdemo
pip install tensorflowjs
```

**3. Set it up**   
    3.1. Convert all policy models in [`policy_models`] to a web-friendly format in `web_demo/policy_models`    
```
ls -d policy_models/*/*/*/ | xargs -I"{}" tensorflowjs_converter --input_format=tf_saved_model [--output_node_names='parkour_walker'] --saved_model_tags=serve --skip_op_check {}tf1_save web_demo/{}
```  
   3.2. Generate the list of policy models
```
python3 policies_to_json.py
```
   3.3. Generate the list of files in [`base_envs_set`]  
```
python3 list_base_envs.py
```

**4. Launch the web app**
```
pushd web_demo/; python3 -m http.server 9999; popd;
```

## HOW TO tutorials
- [Adding a new morphology](HOW_TO_tutorials/add_morphology.md)
- [Adding a new policy model](HOW_TO_tutorials/add_policy_model.md)
- [Adding a new base environment](HOW_TO_tutorials/add_base_env.md)

[`policy_models`]: policy_models
[`web_demo`]: web_demo
[`base_envs_set`]: web_demo/base_envs_set
[`images`]: web_demo/images
[`js`]: web_demo/js
[`bodies`]: web_demo/js/bodies
[`Box2D_dynamics`]: web_demo/js/Box2D_dynamics
[`CPPN`]: web_demo/js/CPPN
[`envs`]: web_demo/js/envs
[`ui_state`]: web_demo/js/ui_state
[`utils`]: web_demo/js/utils
[`box2d.js`]: web_demo/js/box2d.js
[`draw_p5.js`]: web_demo/js/draw_p5js.js
[`game.js`]: web_demo/js/game.js
[`index.html`]: web_demo/index.html
[`index.js`]: web_demo/index.js
[`ui.js`]: web_demo/ui.js
[`demo.css`]: web_demo/demo.css
[`list_base_envs.py`]: list_base_envs.py
[`policies_to_json.py`]: policies_to_json.py
[`i18n.js`]: web_demo/js/i18n.js