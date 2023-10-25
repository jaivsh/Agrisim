from fastapi import APIRouter
from models.farm import FarmData
from database import DatabaseHandler

router = APIRouter(prefix="/api/v1/farm")
db = DatabaseHandler("sqlite:///backend/api/data/farm.db")

@router.post("/new", tags=["FarmData"])
async def new_farm_data(data: FarmData):
    data = db.create_farm_data(data=data)
    return {
        "data": data
    }

@router.get("/{id}", tags=["FarmData"])
async def get_system_data(id: int):
    data = db.get_farm_data(id)
    return {
        "data": data
    }