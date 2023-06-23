# Simple Setup Docker PostgreSQL Environment 
## Using docker compose 
docker compose up
## Opening terminal in the running container
docker exec -it image_name bash
### For our image name
docker exec -it postgres-company bash 
Then should be executed:
psql -U postgres -d company


## For the current example
docker exec -tiu postgres postgres-company psql 

## Accessing database using adminer tool that we described in the yaml file

http://localhost:1234/

Name of the database and other parameters can be seen in the image access-database-adminer.png


