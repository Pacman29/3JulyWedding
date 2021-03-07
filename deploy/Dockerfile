# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
RUN ls
RUN ls ../
RUN ls ../../

COPY *.sln .
COPY 3JulyWedding/*.csproj ./3JulyWedding/
RUN dotnet restore

# copy everything else and build app
COPY 3JulyWedding/. ./3JulyWedding/
WORKDIR /source/3JulyWedding
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app ./
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "3JulyWedding.dll"]
