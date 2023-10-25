from fastapi import FastAPI
import uvicorn
from routes import shc, system_data, user_data, farm

app = FastAPI()

@app.get("/ping", tags=["Root"])
def index():
    return {"data": "pong"}


# <--------------------- Automated Input Package -------------------->
app.include_router(system_data.router)

# <----------------------- User Input Package ----------------------->
app.include_router(user_data.router)

# <-------------------------- SHC Package --------------------------->
app.include_router(shc.router)

# <------------------------- Farm Package --------------------------->
app.include_router(farm.router)

if __name__ == "__main__":
    uvicorn.run("main:app", port=8080, reload=True)