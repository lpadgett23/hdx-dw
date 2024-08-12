-- other setup needed for the postgres container

CREATE USER airbyte_user WITH PASSWORD 'password';

GRANT CREATE, TEMPORARY ON DATABASE hdx_dw TO airbyte_user;


-- Create the user
CREATE USER airbyte_user WITH PASSWORD 'password';

-- Grant database-level privileges
GRANT CREATE, TEMPORARY, CONNECT ON DATABASE hdx_dw TO airbyte_user;

-- Grant schema-level privileges for the public schema (adjust schema name if needed)
GRANT USAGE ON SCHEMA public TO airbyte_user;

-- Grant table-level privileges on all existing tables in the public schema
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES ON ALL TABLES IN SCHEMA public TO airbyte_user;

-- Grant sequence-level privileges on all existing sequences in the public schema
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO airbyte_user;

-- Grant function-level privileges on all existing functions in the public schema
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO airbyte_user;

-- Ensure airbyte_user gets these privileges on any new tables created in the public schema
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLES TO airbyte_user;

-- Ensure airbyte_user gets these privileges on any new sequences created in the public schema
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO airbyte_user;

-- Ensure airbyte_user gets these privileges on any new functions created in the public schema
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT EXECUTE ON FUNCTIONS TO airbyte_user;

--airbyte custom transform to configure
-- import uuid

-- def add_uuid(record):
--     record['uuid'] = str(uuid.uuid4())
--     return record

-- -- Apply the transformation to each record
-- transformed_records = [add_uuid(record) for record in input_records]



-- Create the user
CREATE USER airbyte_user WITH PASSWORD 'password';

-- Grant database-level privileges
GRANT CREATE, TEMPORARY, CONNECT ON DATABASE hdx_dw TO airbyte_user;

-- Grant schema-level privileges for the public schema
GRANT USAGE ON SCHEMA public TO airbyte_user;
GRANT CREATE ON SCHEMA public TO airbyte_user;

-- Grant table-level privileges on all existing tables in the public schema
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES ON ALL TABLES IN SCHEMA public TO airbyte_user;

-- Grant sequence-level privileges on all existing sequences in the public schema
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO airbyte_user;

-- Grant function-level privileges on all existing functions in the public schema
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO airbyte_user;

-- Ensure airbyte_user gets these privileges on any new tables created in the public schema
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES ON TABLES TO airbyte_user;

-- Ensure airbyte_user gets these privileges on any new sequences created in the public schema
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO airbyte_user;

-- Ensure airbyte_user gets these privileges on any new functions created in the public schema
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT EXECUTE ON FUNCTIONS TO airbyte_user;
