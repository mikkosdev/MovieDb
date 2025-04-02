# Tools to Install

- Git
- Docker Desktop
- Azure Cosmos DB Emulator

    - Get the 'NoSQL' variant

- Visual Studio Community 2022

    - Check the following workloads:

        - ASP.NET and web development
        - Azure development
        - Node.js development

- Visual Studio Code

    - Plugins:

        - HashiCorp Terraform
        - PowerShell
        - GitHub Theme (optional)
        - Visual Studio Keymap (optional)

- Azure CLI
- PowerToys (optional)
- Draw.Io Diagrams (optional)
- Multipass or Minikube

# Configurations

- Add Git username and email
- Enable Unrestricted script execution:

    `Set-ExecutionPolicy unrestricted`

- Set new subscription selection off:

    `az config set core.login_experience_v2=off`
    
- Login to Azure:

    `az login`

- Copy subscription values from previous command to `set_env.ps1` under /infrastructure

# Terraform Specific

- Initialize Terraform under /infrastructure/terraform:

    `terraform init`

- Create a Service Principal for Terraform:

    `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID_HERE>"`
