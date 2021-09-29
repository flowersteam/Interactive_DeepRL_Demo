import json
from pathlib import Path
import re

def collect_policies(path: Path):
    policy_list = []

    for agent_type_path in path.iterdir():
        type_entry = {}
        type_entry["type"] = agent_type_path.name
        type_entry["morphologies"] = [get_morphology(morphology_path) for morphology_path in agent_type_path.iterdir()]
        policy_list.append(type_entry)

    return policy_list


def get_morphology(morphology_path: Path):
    morphology_entry = {}
    morphology_entry["morphology"] = morphology_path.name
    seeds = [get_seed(seed_path) for seed_path in morphology_path.iterdir()]
    morphology_entry["seeds"] = sorted(seeds, key = lambda x: x["seed"])

    return morphology_entry


def get_seed(seed_path: Path):
    seed_entry = {}
    seed_entry["seed"] = re.findall('_s(\d+)$', seed_path.name)[0]
    seed_entry["path"] = str(seed_path)
    seed_entry["name"] = get_seed_name(seed_path)
    
    return seed_entry

def get_seed_name(seed_path: Path):
    name_file = seed_path / 'name.txt'
    if name_file.exists():
        with name_file.open() as f:
            name = f.readline()

    return name.strip('\n')

if __name__ == "__main__":
    policy_list = collect_policies(Path('policy_models'))
    print(policy_list)
    with open("web_demo/policies.json", "w") as write_file:
        json.dump(policy_list, write_file)