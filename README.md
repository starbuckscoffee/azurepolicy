# GitHub Action Flow Script

```
on: [workflow_dispatch]

name: CreatePolicyDefinitionSet

jobs:
  deploy-azure-policy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Login to Azure
      uses: azure/login@v1
      with:
        creds: ${{secrets.AZURE_CREDENTIALS}}
        allow-no-subscriptions: true
    - name: Create or Update Azure Policies 
      run: |
        cd 0_6_community
        chmod 755 deployPolicies.sh
        ./deployPolicies.sh
    - name: Create or Update Azure Policy Set
      run: |
        cd 0_6_community
        pwd
        chmod 755 deployPolicySetInitiative.sh
        ./deployPolicySetInitiative.sh
```


# List of azure policy initiative rule set

-  Blob
-  Redis Cache
-  IoT Hub
-  IoT Device Provisioning Service
-  Container Registry
-  Event Hubs & Service Bus
-  Event Grid 
-  Azure Data Explorer
-  IoT Central
-  Azure Digital Twin
-  CosmosDB    (NoSQL, MongoDB, Cassandra, Gremlin, Table)
-  Key Vaults
-  Azure Data Factory
-  Web PubSub
-  SignalR
-  SQL Database


Not Included in Initiative
-  AKS
-  App Service Environment
-  Static Web Apps
-  App Service
-  mysql Single Server



