from sqlmodel import SQLModel, Field, create_engine
from typing import Optional


"""
FarmData represents the data fetched directly from third party APIs and systems
"""
class FarmData(SQLModel, table=True):
    id: Optional[int] = Field(primary_key=True, default=None)
    farmer_id: int = Field(nullable=False)
    system_data_id: int = Field(nullable=False)
    user_data_id: int = Field(nullable=False)
    shc_id: int = Field(nullable=False)

if __name__ == "__main__":
    SQLModel.metadata.create_all(create_engine("sqlite:///backend/api/data/farm.db"))
