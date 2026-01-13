#!/usr/bin/env python3
import os
import re

CATALOG_PATH = "catalog/services.yml"
OUTPUT_DIR = "catalog"

def load_catalog_manual():
    """
    Super simple parser because pip/pyyaml is broken in this env.
    Assumes strict formatting of catalog/services.yml.
    """
    with open(CATALOG_PATH, "r") as f:
        lines = f.readlines()

    data = {"capabilities": [], "sizing": {}}
    current_cap = None
    current_size = None
    in_sizing = False

    for line in lines:
        line = line.strip()
        if not line or line.startswith("#"):
            continue

        if line == "capabilities:":
            in_sizing = False
            continue
        elif line == "sizing:":
            in_sizing = True
            continue

        if not in_sizing:
            # Parsing Capabilities
            if line.startswith("- id:"):
                if current_cap:
                    data["capabilities"].append(current_cap)
                current_cap = {"providers": {}}
                current_cap["id"] = line.split(": ")[1].strip()
            elif current_cap is not None:
                if ":" in line:
                    key, val = line.split(":", 1)
                    key = key.strip()
                    val = val.strip().strip('"')
                    
                    if key in ["name", "criticality", "description"]:
                        if key == "criticality":
                            val = int(val)
                        current_cap[key] = val
                    elif key in ["azure", "aws", "gcp"]:
                        current_cap["providers"][key] = val
        else:
            # Parsing Sizing
            # Assuming format:
            # small:
            #   description: ...
            if line.endswith(":") and not ":" in line[:-1]: # key:
                if current_size:
                    data["sizing"][current_size["key"]] = current_size
                current_size = {"key": line[:-1]}
            elif current_size is not None and ":" in line:
                key, val = line.split(":", 1)
                key = key.strip()
                val = val.strip().strip('"')
                current_size[key] = val

    # Append last items
    if current_cap:
        data["capabilities"].append(current_cap)
    if current_size:
        data["sizing"][current_size["key"]] = current_size

    return data

def render_cloud_equivalents(data):
    content = "# 🗺️ Cloud Equivalents Map\n\n"
    content += "> **Auto-generated** from `catalog/services.yml`. Do not edit manually.\n\n"
    content += "| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | ⭐️ Criticality |\n"
    content += "| :--- | :--- | :--- | :--- | :--- |\n"
    
    for cap in data["capabilities"]:
        # Handle manual parsing potential missing keys gracefully
        prov = cap.get("providers", {})
        azure = prov.get("azure", "TBD")
        aws = prov.get("aws", "TBD")
        gcp = prov.get("gcp", "TBD")
        crit = cap.get("criticality", 1)
        
        row = f"| **{cap.get('name', 'Unknown')}** | {azure} | {aws} | {gcp} | {'⭐' * crit} |\n"
        content += row
        
    with open(os.path.join(OUTPUT_DIR, "cloud-equivalents.md"), "w") as f:
        f.write(content)
    print("✅ Generated catalog/cloud-equivalents.md")

def render_sizing(data):
    content = "# 💰 T-Shirt Sizing\n\n"
    content += "> **Auto-generated** from `catalog/services.yml`. Do not edit manually.\n\n"
    content += "| Size | Environment | Description | Cost Drivers | Approx Cost |\n"
    content += "| :--- | :--- | :--- | :--- | :--- |\n"
    
    # Sort sizing manually since dict is unordered
    order = ["small", "medium", "large"]
    
    for size_key in order:
        if size_key in data["sizing"]:
            details = data["sizing"][size_key]
            row = f"| **{size_key.upper()}** | `{details.get('environment', '?')}` | {details.get('description', '')} | {details.get('cost_driver', '')} | **{details.get('approx_cost', '')}** |\n"
            content += row
        
    with open(os.path.join(OUTPUT_DIR, "sizing.md"), "w") as f:
        f.write(content)
    print("✅ Generated catalog/sizing.md")

def main():
    if not os.path.exists(CATALOG_PATH):
        print(f"❌ Error: {CATALOG_PATH} not found.")
        exit(1)
        
    data = load_catalog_manual()
    render_cloud_equivalents(data)
    render_sizing(data)

if __name__ == "__main__":
    main()
