from fastapi import APIRouter
from models.user_data import UserData
from database import DatabaseHandler

router = APIRouter(prefix="/api/v1/user-data")
db = DatabaseHandler("sqlite:///backend/api/data/user_data.db")

@router.post("/new", tags=["UserData"])
async def create_user_data(data: UserData):
    data = db.create_user_data(data)
    return {
        "data": data
    }

@router.get("/{id}", tags=["UserData"])
async def get_user_data(id: int):
    data = db.get_user_data(id)
    return {
        "data": data
    }