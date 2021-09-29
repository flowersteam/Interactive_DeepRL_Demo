import json
from os import listdir

if __name__ == "__main__":
    envs_list = {}
    envs_list["filenames"] = sorted([f for f in listdir('web_demo/base_envs_set')])
    with open("web_demo/base_envs_set.json", "w") as write_file:
        json.dump(envs_list, write_file)