param location string = resourceGroup().location
param planName string = 'plan${uniqueString(resourceGroup().id)}'
param webAppName string = 'webapp${uniqueString(resourceGroup().id)}'

resource plan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: planName
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2024-04-01' = {
  name: webAppName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: plan.id
  }
}

output actualWebAppName string = webApp.name
