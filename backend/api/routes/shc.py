from fastapi import APIRouter
from database import DatabaseHandler

router = APIRouter(prefix="/api/v1/shc")
db = DatabaseHandler("sqlite:///backend/api/data/shc_data.db")

# Fetches the SHC Data based on the phone number
@router.get("/{phone}", tags=["SHC"])
async def post_shc_data(phone: int):
    return {
        "data": db.get_shc_data(phone=phone) or "SHC not found"
    }