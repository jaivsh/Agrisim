from sqlmodel import select, Session, create_engine
from models.shc import SHCData
from models.system_data import SystemData
from models.user_data import UserData
from models.farm import FarmData

class DatabaseHandler:
    def __init__(self, db_uri: str):
        self.db_uri = db_uri
        self.engine = create_engine(db_uri)

    # Returning a database session
    @property
    def session(self) -> Session:
        return Session(self.engine)
    
    # <--------------- SystemData Methods ------------------>
    # Creating a new system data packet
    def create_system_data(self, data: SystemData) -> SystemData:
        with self.session as session:
            session.add(data)
            session.commit()
            session.refresh(data)
            return data
        
    # Fetching data by id
    def get_system_data(self, id: int) -> SystemData:
        with self.session as session:
            data: SystemData | None = session.exec(select(SystemData).where(SystemData.id == id)).first()
            return data
        
    # <--------------- UserData Methods ------------------>
    # Creating a new user data packet
    def create_user_data(self, data: UserData) -> UserData:
        with self.session as session:
            session.add(data)
            session.commit()
            session.refresh(data)
            return data
        
    # Fetching data by id
    def get_user_data(self, id: int) -> UserData:
        with self.session as session:
            data: UserData | None = session.exec(select(UserData).where(UserData.id == id)).first()
            return data
        
    # <--------------- FarmData Methods ------------------>
    # Creating a new farm data packet
    def create_farm_data(self, data: FarmData) -> FarmData:
        with self.session as session:
            session.add(data)
            session.commit()
            session.refresh(data)
            return data
        
    # Fetching data by id
    def get_farm_data(self, id: int) -> FarmData:
        with self.session as session:
            data: FarmData | None = session.exec(select(FarmData).where(FarmData.id == id)).first()
            return data

    # <------------------ SHC Methods ---------------------->
    # Getting SHC data from the database
    def get_shc_data(self, phone: int) -> SHCData | None:
        with self.session as session:
            data: SHCData | None = session.exec(select(SHCData).where(SHCData.phone == phone)).first()
            return data
        
    # Create a dummy seed data for testing purposes/verification
    def create_seed_data(self) -> int:
        data = SHCData(
            phone = 1234567890,
            nitrogen= 7,
            potassium=9,
            phosphorus=30,
            zinc=10,
            iron=5,
            copper=7,
            manganese=6,
            barium=30,
            ph=6.5,
            ec=12,
            oc=9
        )

        with self.session as session:
            session.add(data)
            session.commit()
            session.refresh(data)
            return data.id
        
if __name__ == "__main__":
    db = DatabaseHandler("sqlite:///backend/api/data/shc_data.db")
    db.create_seed_data()
        