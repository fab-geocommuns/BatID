# Copyright (C) 2022, BatID.

# This program is licensed under the Apache License version 2.
# See LICENSE or go to <https://www.apache.org/licenses/LICENSE-2.0.txt> for full license details.

from sqlalchemy import create_engine
from sqlalchemy import inspect
from geoalchemy2 import Geometry #to be able to handle geometry type
import pandas as pd

import src.db.config as cfg

engine = create_engine(cfg.DATABASE_CONNECTION_URI)

inspector = inspect(engine)

writer = pd.ExcelWriter('data_dict_batiment.xlsx')

tables = pd.DataFrame(columns=['table', 'description'], dtype=object)

default_schema = "rnb"

for t in inspector.get_table_names(default_schema):
    tables = tables.append({"table": t,
                            "description":
                            inspector.get_table_comment(t,
                                                        schema=default_schema)["text"]},
                            ignore_index=True)

    df = pd.DataFrame(inspector.get_columns(table_name=t,
                                            schema=default_schema))
    df = df.drop(columns=['default', "autoincrement"])
    df.to_excel(writer, sheet_name=t, index=False)

tables.to_excel(writer, sheet_name='TABLES DESCRIPTION', index=False)
writer.save()
