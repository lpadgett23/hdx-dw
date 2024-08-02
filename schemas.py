from sqlalchemy import Table, Column, Integer, String, MetaData, Float

# Define the table schemas in this file
table_schemas = {
    "weather_table_1": Table(
        "weather_table_1", MetaData(),
        Column("datetime", String, primary_key=True),
        Column("id", Integer, primary_key=True),
        Column("name", String),
        Column("temperature", Float),
        Column("population", Integer)
    ),
    "weather_table_2": Table(
        "weather_table_2", MetaData(),
        Column("datetime", String, primary_key=True),
        Column("id", Integer, primary_key=True),
        Column("name", String),
        Column("temperature", Float),
        Column("humidity", Integer)  # Example different column
    ),
    # Add more table schemas as needed
}




# in my other main module: from schemas import table_schemas