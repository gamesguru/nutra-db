-- Use common schema
DROP SCHEMA inutra CASCADE;
CREATE SCHEMA inutra;
SET search_path TO inutra;
-- Create tables
\i tmp/bfdb.sql
\i tmp/cnf.sql
\i tmp/ofdb.sql
\i tmp/usda.sql
