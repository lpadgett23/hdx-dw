CREATE TABLE food_security (
    resource_hdx_id INTEGER PRIMARY KEY,
    admin2_ref VARCHAR,
    ipc_pe VARCHAR,
    ipc_type VARCHAR,
    population_in_pe INTEGER,
    population_fraction_in_pe INTEGER,
    reference_period_start TIMESTAMP,
    location_code VARCHAR,
    location_name VARCHAR,
    admin1_code VARCHAR,
    admin1_name VARCHAR,
    location_ref VARCHAR,
    admin2_code VARCHAR,
    admin2_name VARCHAR,
    admin1_ref VARCHAR
);

CREATE TABLE food_prices (
    resource_hdx_id INTEGER PRIMARY KEY,
    market_code INTEGER,
    market_name VARCHAR,
    commodity_code VARCHAR,
    commodity_name VARCHAR,
    commodity_category VARCHAR,
    price_flag VARCHAR,
    price_type VARCHAR,
    price NUMERIC,
    unit VARCHAR,
    currency_code INTEGER,
    lat NUMERIC,
    lon NUMERIC,
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP,
    location_ref VARCHAR,
    location_code VARCHAR,
    location_name VARCHAR,
    admin1_ref VARCHAR,
    admin1_code VARCHAR,
    admin1_name VARCHAR,
    admin2_ref VARCHAR,
    admin2_code VARCHAR,
    admin2_name VARCHAR
);

CREATE TABLE refugees (
    resource_hdx_id INTEGER PRIMARY KEY,
    origin_location_ref VARCHAR,
    asylum_location_ref VARCHAR,
    population_group VARCHAR,
    gender VARCHAR,
    age_range VARCHAR,
    min_age INTEGER,
    max_age INTEGER,
    population INTEGER,
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP,
    origin_location_code VARCHAR,
    origin_location_name VARCHAR,
    asylum_location_code VARCHAR,
    asylum_location_name VARCHAR
);

CREATE TABLE humanitarian_needs (
    resource_hdx_id INTEGER PRIMARY KEY,
    admin2_ref VARCHAR,
    gender VARCHAR,
    age_range VARCHAR,
    min_age	 INTEGER,
    max_age INTEGER,
    disabled_marker VARCHAR,
    sector_code VARCHAR,
    population_group VARCHAR,
    population_status VARCHAR,
    population INTEGER,
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP,
    sector_name VARCHAR,
    location_code VARCHAR,
    location_name VARCHAR,
    location_ref VARCHAR,
    admin1_code VARCHAR,
    admin1_name VARCHAR,
    admin2_code VARCHAR,
    admin2_name VARCHAR,
    admin1_ref VARCHAR
);

CREATE TABLE Coordination3ws (
    sector_code VARCHAR, 
    resource_hdx_id INTEGER,
    org_acronym VARCHAR, 
    org_name VARCHAR, 
    org_type_code VARCHAR, 
    org_type_description VARCHAR, 
    sector_name VARCHAR, 
    location_ref VARCHAR, 
    location_code VARCHAR,
    location_name VARCHAR, 	
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP,
    admin1_ref VARCHAR, 
    admin1_code VARCHAR, 
    admin1_name VARCHAR, 
    admin2_ref VARCHAR, 	
    admin2_code VARCHAR, 
    admin2_name VARCHAR 
);

CREATE TABLE funding (
    resource_hdx_id	 INTEGER PRIMARY KEY,
    appeal_code VARCHAR,
    appeal_name VARCHAR,
    appeal_type VARCHAR,
    requirements_usd NUMERIC,
    funding_usd	 NUMERIC,
    funding_pct VARCHAR,
    location_ref VARCHAR,
    location_code VARCHAR,
    location_name VARCHAR,
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP
);

CREATE TABLE conflict_events (
    event_type VARCHAR,
    events VARCHAR,
    fatalities	 INTEGER,
    resource_hdx_id INTEGER, 
    location_ref VARCHAR,
    location_code VARCHAR,
    location_name VARCHAR,
    admin1_ref VARCHAR,
    admin1_code VARCHAR,
    admin1_name VARCHAR,
    admin2_ref VARCHAR,
    admin2_code VARCHAR,
    admin2_name VARCHAR,
    reference_period_start TIMESTAMP,	
    reference_period_end TIMESTAMP
);

CREATE TABLE national_risk (
    risk_cs VARCHAR,
    global_rank INTEGER,
    hazard_exposure_risk INTEGER,
    vulnerability_risk INTEGER,
    coping_capacity_risk INTEGER,
    meta_missing_indicators_pct NUMERIC,
    meta_avg_recentness_years INTEGER,
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP,
    resource_hdx_id INTEGER,
    location_code VARCHAR,
    location_name VARCHAR,
    location_ref VARCHAR
);

CREATE TABLE baseline_population (
    resource_hdx_id INTEGER PRIMARY KEY,
    admin2_ref VARCHAR,
    gender VARCHAR,
    age_range VARCHAR,
    min_age INTEGER,
    max_age INTEGER,
    population INTEGER,	
    reference_period_start TIMESTAMP,
    reference_period_end TIMESTAMP,
    location_ref VARCHAR,
    location_code VARCHAR,
    location_name VARCHAR,
    admin1_ref VARCHAR,
    admin1_code VARCHAR,
    admin1_name VARCHAR,
    admin2_code VARCHAR,
    admin2_name VARCHAR
);

CREATE TABLE poverty_rate (
    resource_hdx_id INTEGER PRIMARY KEY,
    admin1_name VARCHAR,
    mpi NUMERIC,
    headcount_ratio NUMERIC,
    intensity_of_deprivation NUMERIC,
    vulnerable_to_poverty NUMERIC,
    in_severe_poverty NUMERIC,
    reference_period_start TIMESTAMP,	
    reference_period_end TIMESTAMP,
    location_code VARCHAR,
    location_name VARCHAR,
    location_ref VARCHAR
);