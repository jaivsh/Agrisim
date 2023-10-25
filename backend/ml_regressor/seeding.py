"""
SEEDING
Creating a dummy dataset for training the model.
"""

import random
import csv
from datetime import datetime, timedelta

# List of possible crop growth stages
crop_growth_stages = ["Seedling", "Vegetative", "Flowering", "Fruiting"]

# Generate a dataset with 500 entries
num_entries = 100
dataset = []

for _ in range(num_entries):
    # Simulate random weather conditions and soil conditions
    temperature = round(random.uniform(22, 35))  
    humidity = round(random.uniform(40, 90))    
    pH = round(random.uniform(5.5, 7.5))        
    nitrogen = random.choice(["Low", "Medium", "High"]) 
    growth_stage = random.choice(crop_growth_stages)    

    # Calculate optimal planting time (random days from now)
    days_to_add = random.randint(10, 90)
    optimal_planting_time = (datetime.now() + timedelta(days=days_to_add)).strftime("%b %d")

    # Simulate expected crop yield (random value)
    expected_crop_yield = round(random.uniform(800, 2200))  # Crop yield in kg/acre

    # Append data entry to the dataset
    entry = {
        "Temperature": temperature,
        "Humidity": humidity,
        "pH": pH,
        "Nitrogen": nitrogen,
        "CropGrowthStage": growth_stage,
        "OptimalPlantingTime": optimal_planting_time,
        "ExpectedCropYield": expected_crop_yield
    }
    dataset.append(entry)

# Print the first few entries as an example
for i in range(5):
    print(dataset[i])

with open("../data/dataset.csv", "w") as f:
    writer = csv.writer(f)
    writer.writerow(["Temperature", "Humidity", "pH", "Nitrogen", "CropGrowthStage", "OptimalPlantingTime", "ExpectedCropYield"])
    for entry in dataset:
        writer.writerow([entry["Temperature"], entry["Humidity"], entry["pH"], entry["Nitrogen"], entry["CropGrowthStage"], entry["OptimalPlantingTime"], entry["ExpectedCropYield"]])
