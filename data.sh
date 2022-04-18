#!/bin/bash

# Create Nutanix table
oc exec -it postgresql-prod-0 -- psql "postgresql://postgres:$POSTGRES_PASSWORD@127.0.0.1/postgres" postgres -c "CREATE TABLE nutanix (id serial PRIMARY KEY, name VARCHAR ( 50 ) UNIQUE NOT NULL, location VARCHAR ( 50 ) NOT NULL, address VARCHAR ( 255 ) UNIQUE NOT NULL, created_on TIMESTAMP NOT NULL);"

#Insert values into Nutanix table
oc exec -it postgresql-prod-0 -- psql "postgresql://postgres:$POSTGRES_PASSWORD@127.0.0.1/postgres" postgres -c "INSERT INTO nutanix (id, name, location, address, created_on) VALUES (1,'Karbon','USA','San Jose','2009-09-01') ;"

sleep 90

# Create Redhat table
oc exec -it postgresql-prod-0 -- psql "postgresql://postgres:$POSTGRES_PASSWORD@127.0.0.1/postgres" postgres -c "CREATE TABLE redhat (id serial PRIMARY KEY, name VARCHAR ( 50 ) UNIQUE NOT NULL, location VARCHAR ( 50 ) NOT NULL, address VARCHAR ( 255 ) UNIQUE NOT NULL, created_on TIMESTAMP NOT NULL);"


#Insert values into Redhat table
oc exec -it postgresql-prod-0 -- psql "postgresql://postgres:$POSTGRES_PASSWORD@127.0.0.1/postgres" postgres -c "INSERT INTO redhat (id, name, location, address, created_on) VALUES (2,'OpenShift','USA','North Carolina','1993-03-26') ;"
