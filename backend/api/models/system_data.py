from sqlmodel import SQLModel, Field, create_engine
from typing import Optional


"""
Systemdata represents the data fetched directly from third party APIs and systems
"""
class SystemData(SQLModel, table=True):
    id: Optional[int] = Field(primary_key=True, default=None)
    latitude: float = Field(nullable=False)
    longitude: float = Field(nullable=False)
    annual_rainfall: float = Field(nullable=False)
    temperature: float = Field(nullable=False)
    humidity: float = Field(nullable=False) 

if __name__ == "__main__":
    SQLModel.metadata.create_all(create_engine("sqlite:///backend/api/data/system_data.db"))
