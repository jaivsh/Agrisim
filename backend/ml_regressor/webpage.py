import pickle
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder


# Loading the model
with open("data/model.pkl", "rb") as f:
    model = pickle.load(f)

# Dummy data
new_data = pd.DataFrame({
    "Temperature": [25],  
    "Humidity": [70],     
    "pH": [6.5],          
    "Nitrogen": ["Medium"]  
})

# One Hot Encoding
df = pd.read_csv("data/dataset.csv")
column_transformer = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), ['Nitrogen'])], remainder='passthrough')
column_transformer.fit_transform(df[["Temperature", "Humidity", "pH", "Nitrogen"]])

new_data_encoded = column_transformer.transform(new_data)

# Predicting
predicted_yield = model.predict(new_data_encoded)

print(predicted_yield[0])
