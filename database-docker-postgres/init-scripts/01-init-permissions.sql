\c keystonedb;

GRANT ALL PRIVILEGES ON SCHEMA public TO keystoneuser;
ALTER USER keystoneuser WITH CREATEDB;
ALTER DATABASE keystonedb OWNER TO keystoneuser;