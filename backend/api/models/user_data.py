from sqlmodel import SQLModel, Field, create_engine
from typing import Optional


"""
UserData represents the data inputted by the user
"""
class UserData(SQLModel, table=True):
    id: Optional[int] = Field(primary_key=True, default=None)
    area: float = Field(nullable=False)
    crop_type: str = Field(nullable=False)
    soil_type: str = Field(nullable=False)

if __name__ == "__main__":
    SQLModel.metadata.create_all(create_engine("sqlite:///backend/api/data/user_data.db"))
