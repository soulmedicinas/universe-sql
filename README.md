TO SAVE:  pg_dump -cC --inserts -U freecodecamp universe > universe.sql
TO REBUILD: psql -U postgres < universe.sql 
OR
psql -U freecodecamp -f iniverse.sql
then
psql --username=freecodecamp --dbname=postgres
