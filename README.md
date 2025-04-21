# MovieDb

This is a demo project for a movie database with a ASP.NET Core C# backend and React+TypeScript frontend.

It has the following features:

- Uses Azure
- Terraform Infrastructure-as-Code scripts that create:

    - 2 Resource Groups
    - A Virtual Network
    - Azure Container Registry
    - Azure Kubernetes Service
    - Cosmos DB for NoSQL API

- Deploys to Azure AKS
- Docker images
- ASP.NET Core solution with 2 projects:

    - MovieDb.AppHost (C#)
    - MovieDb.Server (ASP.NET Core C#)
    - moviedb.client (React)

- Kubernetes configuration with:

    - 2 services: client and server
    - 2 deployments: client and server
    - 1 ingress that connects to the client service
    