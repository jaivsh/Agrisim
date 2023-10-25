"""
BLOOM FINE-TUNING
Fine tuning the bloom LLM using our custom dataset
"""
import transformers
from datasets import load_dataset

# Fetching the model
# Using Bloom model
print("[FINE-TUNE] Fetching Bloom Model...")
model = transformers.AutoModelForSequenceClassification.from_pretrained("bigscience/bloom")

# Loading and splitting the dataset
print("[FINE-TUNE] Fetching Dataset...")
dataset = load_dataset("csv", data_files="../data/dataset.csv")
train_dataset, test_dataset = dataset.split(0.8)

# Fine tuning
print("[FINE-TUNE] Initiating Fine Tuning...")
trainer = transformers.Trainer(
    model = model,
    train_dataset=train_dataset,
    test_dataset=test_dataset,
    num_epochs=10
)

print("[FINE-TUNE] Training...")
trainer.train()

# Evaluating
print("[FINE-TUNE] Evaluating...")
trainer.evaluate(test_dataset)