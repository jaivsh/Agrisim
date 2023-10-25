from fastapi import APIRouter
from models.system_data import SystemData
from database import DatabaseHandler

router = APIRouter(prefix="/api/v1/system-data")
db = DatabaseHandler("sqlite:///backend/api/data/system_data.db")

@router.post("/new", tags=["SystemData"])
async def new_system_data(data: SystemData):
    data = db.create_system_data(data=data)
    return {
        "data": data
    }

@router.get("/{id}", tags=["SystemData"])
async def get_system_data(id: int):
    data = db.get_system_data(id)
    return {
        "data": data
    }