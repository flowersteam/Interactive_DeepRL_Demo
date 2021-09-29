# Adding a new base environment

You can easily add a new environment to the base set which is displayed in the *Getting Started* tab in the demo.

![Base environments set](graphics/base_envs_set.png)

**1. Save and download an environment**  
The first thing you need to do is to get a JSON file containing the data of the environment you want to add. To do that you, after customizing the environment at your convenience, you first need to save it to the custom set of environments and then to download it.

![Save and download an environment](graphics/save_dl_env.gif)

**2. Modify the description of the environment**  
In order to have the name and text description of the environment available in all languages for the base environments, it is necessary to modify the description part in the JSON file.  
To do that, you just need to change the description object according to the following format:
```
"description": {
  "EN": {
    "name": "Name in English",
    "text": "Description in English."
  }, 
  "FR": {
    "name": "Name in French",
    "text": "Description in French."
  }
},
```

**3. Add the downloaded JSON file to the [`base_envs_set`] folder**

**4. [Optional] Set up for local launch**  
Generate the list of files in [`base_envs_set`]  
```
python3 list_base_envs.py
```

[`base_envs_set`]: ../web_demo/base_envs_set 