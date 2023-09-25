# Use the official image for the .NET SDK 7.0
FROM mcr.microsoft.com/dotnet/sdk:7.0.401-alpine3.18-amd64 as build_env

WORKDIR /app
COPY . ./

RUN dotnet publish HelloRedis.Web --configuration Release --output out --no-self-contained


# Optionally, you can specify an entrypoint or a command to run when the container starts
# For example, if you want to run the published application, you can use:
# ENTRYPOINT ["dotnet", "out/myapp.dll"]

FROM mcr.microsoft.com/dotnet/aspnet:7.0.11-alpine3.18-amd64
WORKDIR /app
COPY --from=build_env /app/out .

ENTRYPOINT ["dotnet","HelloRedis.Web.dll"]