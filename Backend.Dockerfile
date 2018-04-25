FROM microsoft/aspnetcore-build:2.0.5-2.1.4 AS build

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./src/backend/app/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./src/backend/app ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/aspnetcore:2.0

WORKDIR /app
COPY --from=build /app/out .


ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
ENV ASPNETCORE_ENVIRONMENT=Docker



ENTRYPOINT ["dotnet", "devops-app-api.dll"]