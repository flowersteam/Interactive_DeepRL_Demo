# Adding a new morphology

**1. Implementing the morphology's code**  
The first step is to code the morphology's body in a new file that will be placed in a folder corresponding to its type of morphology inside the [`bodies`] folder.  
If the morphology to be added is of a new type, just create a new folder for this type in [`bodies`] and code its abstract class.

**2. Adding policies**  
Create appropriate folders in [`policy_models`] and follow the [`add_policy_model`] tutorial to add some policies for your new morphology.

**3. Handle morphology dependencies in the code**
- [`multi_agents_continous_parkour.js`]: Add a case to handle your morphology inside the `create_agent` function.   
- [`draw_p5.js`]: Add a case to handle your morphology inside the `drawName`, `drawObservation` and `drawReward` functions.  
- [`i18n.js`]: Add an entry with a title and a description for your morphology to the `morphologies` entry for all languages.

**4. [Optional] Set up for local launch**  
4.1. Convert the policy models of your new morphology to a web-friendly format
 ```
 ls -d policy_models/<type>/<morphology>/*/ | xargs -I"{}" tensorflowjs_converter --input_format=tf_saved_model --saved_model_tags=serve --skip_op_check {}tf1_save web_demo/{}
 ```
4.2. Generate the list of policy models
```
python3 policies_to_json.py
```

**5. Add a thumbnail for your morphology**  
Once all is set up and you can add an agent with your morphology to the simulation, you just need to take a screenshot of it and add it to [`agents_thumbnails`] with the name `<morphology_name>_thumbnail.png`.




[`bodies`]: ../web_demo/js/bodies
[`policy_models`]: ../policy_models
[`add_policy_model`]: ./add_policy_model.md
[`actions.js`]: ../web_demo/js/ui_state/store/actions.js
[`multi_agents_continous_parkour.js`]: ../web_demo/js/envs/multi_agents_continuous_parkour.js
[`draw_p5.js`]: ../web_demo/js/draw_p5js.js
[`i18n.js`]: ../web_demo/js/i18n.js
[`morphologies_list.js`]: ../web_demo/js/ui_state/components/morphologies_list.js
[`agents_list.js`]: ../web_demo/js/ui_state/components/agents_list.js
[`agents_thumbnails`]: ../web_demo/images/agents_thumbnails