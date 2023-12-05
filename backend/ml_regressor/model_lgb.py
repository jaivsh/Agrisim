import pandas as pd
from sklearn.model_selection import train_test_split
import lightgbm as lgb
import numpy as np
df = pd.read_csv("backend/data/fertilizer.csv")
df.head()

df = df.rename({'Fertilizer Name': 'Fertilizer','Crop Type': 'Crop_Type','Soil Type': 'Soil_Type'}, axis=1)

# One hot encoding
categorical_features=[feature for feature in df.columns if df[feature].dtype=='O']
categorical_features.remove('Fertilizer')
new_encoded_columns = pd.get_dummies(df[categorical_features])
df = pd.concat([df,new_encoded_columns],axis="columns")
df = df.drop(categorical_features,axis="columns")
df.head()
X = df.drop("Fertilizer",axis=1)
y = df["Fertilizer"]

# Splitting data into test and train

X_train, x_test, y_train, y_test = train_test_split(X, y, test_size = 0.2,shuffle=True)

model = lgb.LGBMClassifier()
model.fit(X_train,y_train)

def get_input(x):
    x_structure = {
        "Temparature": 0, "Humidity": 1, "Moisture": 2, "Nitrogen": 3,
        "Potassium": 4, "Phosphorous": 5, "Black": 6,  "Clayey": 7, "Loamy": 8,
        "Red": 9, "Sandy": 10, "Barley": 11, "Cotton": 12, "Ground Nuts": 13, "Maize": 14,
        "Millets": 15, "Oil seeds": 16, "Paddy": 17, "Pulses": 18, "Sugarcane": 19, "Tobacco": 20,
        "Wheat": 21
    }

    output = np.zeros(len(x_structure))
    output[0] = x[0]
    output[1] = x[1]
    output[2] = x[2]
    output[3] = x[3]
    output[4] = x[4]
    output[5] = x[5]
    output[x_structure[x[6]]] = 1
    output[x_structure[x[7]]] = 1
    return output

di = get_input([25,50,26,15,14,11,"Red","Ground Nuts"])

model.predict([di])[0]
