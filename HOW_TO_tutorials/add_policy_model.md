# Adding a new policy model
You can easily add a new policy model for a specific morphology to visualize its behaviour inside the demo.

**1. Train a policy**  
   You first need a saved policy model corresponding to one of the available morphologies. If you want to train a new policy on your own, follow the installation and launching steps of the [TeachMyAgent](http://developmentalsystems.org/TeachMyAgent/doc/#installation) repository.
   This policy model must be in the **TensorFlow SavedModel** format and organized as follows:  
   📂 policy_folder  
   ┣ 📂 tf1_save     
   ┃ ┣ 📂 variables   
   ┃ ┃ ┣ 📜 variables.data-00000-of-00001  
   ┃ ┃ ┗ 📜 variables.index  
   ┃ ┣ 📜 model_info.plk  
   ┃ ┗ 📜 saved_model.pb  
   ┗ 📜 name.txt -- *contains the name and age of the policy*

The name and age of the policy in `name.txt` must be separated by a `/` and the age must be "adult", "teenager" or "baby".

**2. Add the policy to the demo**  
   Then you just need to add this `policy_folder` to the corresponding **morphology folder** in [`policy_models`] among the following:  
   📂 [`policy_models`]    
   ┣ 📂 [`climber`]       
   ┃ ┗ 📂 [`chimpanzee`]  
   ┣ 📂 [`swimmer`]  
   ┃ ┗ 📂 [`fish`]  
   ┣ 📂 [`walker`]  
   ┃ ┣ 📂 [`bipedal`]  
   ┃ ┗ 📂 [`spider`]

Your policy model will now automatically appear inside the demo, in the list of agents available for the corresponding morpholgy.

**3. [Optional] Set up for local launch**  
   3.1. Convert your policy model to a web-friendly format
 ```
 ls -d policy_models/<type>/<morphology>/<policy_folder>/ | xargs -I"{}" tensorflowjs_converter --input_format=tf_saved_model --saved_model_tags=serve --skip_op_check {}tf1_save web_demo/{}
 ```
   3.2. Generate the list of policy models
```
python3 policies_to_json.py
```

[`policy_models`]: ../policy_models
[`climber`]: ../policy_models/climber
[`chimpanzee`]: ../policy_models/climber/chimpanzee
[`swimmer`]: ../policy_models/swimmer
[`fish`]: ../policy_models/swimmer/fish
[`walker`]: ../policy_models/walker
[`bipedal`]: ../policy_models/walker/bipedal
[`spider`]: ../policy_models/walker/spider
[`actions.js`]: ../web_demo/js/ui_state/store/actions.js