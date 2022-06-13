# Copyright (C) 2022, BatID.

# This program is licensed under the Apache License version 2.
# See LICENSE or go to <https://www.apache.org/licenses/LICENSE-2.0.txt> for full license details.

import os
from dotenv import load_dotenv

load_dotenv()

user = os.environ.get("POSTGRES_USER")
password = os.getenv('POSTGRES_PASSWORD')
host = os.getenv('POSTGRES_HOST')
database = os.getenv('POSTGRES_DB')
port = os.getenv('POSTGRES_PORT')

DATABASE_CONNECTION_URI = f'postgresql://{user}:{password}@{host}:{port}/{database}'
