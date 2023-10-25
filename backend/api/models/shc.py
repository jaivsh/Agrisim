from sqlmodel import SQLModel, Field, create_engine
from typing import Optional


"""
SHC - Soil Health Card Data is the data fetched from the SHC Card owned by the farmer
"""
class SHCData(SQLModel, table=True):
    id: Optional[int] = Field(primary_key=True, default=True)
    phone: int = Field(nullable=False)
    # NPK Values (Micro parameters)
    nitrogen: float = Field(nullable = False)
    phosphorus: float = Field(nullable = False)
    potassium: float = Field(nullable = False)
    # Macro parameters
    zinc: float = Field(nullable = False)
    iron: float = Field(nullable = False)
    copper: float = Field(nullable = False)
    manganese: float = Field(nullable = False)
    barium: float = Field(nullable = False)
    # Physical parameters
    ph: float = Field(nullable = False)
    ec: float = Field(nullable = False)
    oc: float = Field(nullable = False)

if __name__ == "__main__":
    SQLModel.metadata.create_all(create_engine("sqlite:///backend/api/data/shc_data.db"))
