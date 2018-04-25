FROM microsoft/mssql-server-linux:latest

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD="5g6h7J8k9l"
ENV MSSQL_PID=Express

COPY ./src/backend/db/ /app

RUN chmod +x /app/initializedb.sh

CMD /bin/bash /app/entrypoint.sh