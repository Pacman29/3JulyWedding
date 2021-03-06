FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app


COPY 3JulyWedding/*.csproj ./
RUN dotnet restore


COPY 3JulyWedding/. ./
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
CMD ASPNETCORE_URLS=http://*:$PORT dotnet 3JulyWedding.dll