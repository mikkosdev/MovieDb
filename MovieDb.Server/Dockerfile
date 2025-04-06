# SDK + Node.js stage (Alpine)
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS with-node
RUN apk add --no-cache curl nodejs npm       # Install everything in one clean step


FROM with-node AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["MovieDb.Server/MovieDb.Server.csproj", "MovieDb.Server/"]
COPY ["moviedb.client/moviedb.client.esproj", "moviedb.client/"]
RUN dotnet restore "./MovieDb.Server/MovieDb.Server.csproj"
COPY . .
WORKDIR "/src/MovieDb.Server"
RUN dotnet build "./MovieDb.Server.csproj" -c $BUILD_CONFIGURATION -o /app/build


FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./MovieDb.Server.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false


# Final runtime image using Alpine
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS final
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

RUN apk add --no-cache curl                                   # <<< CHANGED: install curl in final
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MovieDb.Server.dll"]
