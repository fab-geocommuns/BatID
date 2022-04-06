from sqlalchemy import create_engine
from databases import Database
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

import src.db.config as cfg

engine = create_engine(cfg.DATABASE_CONNECTION_URI)

database = Database(cfg.DATABASE_CONNECTION_URI)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()






#metadata = Base.metadata

#metadata.drop_all(bind=engine)

#metadata.create_all(bind=engine)

