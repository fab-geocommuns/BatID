import os
from dotenv import load_dotenv

load_dotenv()

user = os.environ.get("POSTGRES_USER")
password = os.getenv('POSTGRES_PASSWORD')
host = os.getenv('POSTGRES_HOST')
database = os.getenv('POSTGRES_DB')
port = os.getenv('POSTGRES_PORT')

DATABASE_CONNECTION_URI = f'postgresql://{user}:{password}@{host}:{port}/{database}'
