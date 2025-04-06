# NOTE: Run set_env.ps1 first!

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$Env:ARM_SUBSCRIPTION_ID"

az role assignment create `
    --assignee $Env:ARM_CLIENT_ID `
    --role "User Access Administrator" `
    --scope /subscriptions/$Env:ARM_SUBSCRIPTION_ID`
