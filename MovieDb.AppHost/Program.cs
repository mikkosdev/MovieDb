var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.MovieDb_Server>("moviedb-server");

builder.Build().Run();
