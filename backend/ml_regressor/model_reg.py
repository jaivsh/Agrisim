"""
REGRESSOR / CLASSIFIER MODEL
Regressor Field Comparison
Predicting the crop yield using ML
"""

import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
from sklearn.svm import SVR
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.metrics import r2_score
import pickle

# Reading the CSV
print("[RFC] Fetching Dataset...")
df = pd.read_csv("../data/dataset.csv")

# One Hot Encoding
print("[RFC] One Hot Encoding models...")
column_transformer = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), ['Nitrogen'])], remainder='passthrough')
X = column_transformer.fit_transform(df[["Temperature", "Humidity", "pH", "Nitrogen"]])
y = df["ExpectedCropYield"]

# Model
print("[RFC] Training models...")
models = [LinearRegression(), RandomForestRegressor(), SVR(), GradientBoostingRegressor()]
r2_list = []
trained = []

print("[RFC] R-Squared scores: ")
for model in models:
    model.fit(X, y)
    y_pred = model.predict(X)
    r2 = r2_score(y, y_pred)
    r2_list.append(r2)
    trained.append(model)
    print(f"- {model.__class__.__name__}: {r2:.4f}")

# Saving Best Model
print("[RFC] Saving best model...")
idx = r2_list.index(max(r2_list))
with open("../data/model.pkl", "wb") as f:
    pickle.dump(trained[idx], f)

print("[RFC] RFC Successful..!")




