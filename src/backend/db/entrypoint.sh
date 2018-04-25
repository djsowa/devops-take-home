#start SQL Server, start the script to create the DB 
/opt/mssql/bin/sqlservr & /app/initializedb.sh

tail -f /dev/null