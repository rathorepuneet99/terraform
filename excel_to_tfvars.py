import pandas as pd
import json

df = pd.read_excel("input.xlsx")

instances = []

for _, row in df.iterrows():
    instances.append({
        "name": row["name"],
        "ami": row["ami"],
        "instance_type": row["instance_type"],
        "subnet_id": row["subnet"],
        "tags": {
            "Environment": row["tag_env"]
        }
    })

with open("terraform.tfvars.json", "w") as f:
    json.dump({"instances": instances}, f, indent=2)