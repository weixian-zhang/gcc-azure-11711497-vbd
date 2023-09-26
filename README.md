## Requirements

1. A custom Azure Automanage Machine Configuration that checks for Registry keys and values in Windows Server,
  against a list of supplied Registry keys/values as parameters through Azure Policy parameters.

2. Daily CSV report of compliance data:
   a cloud native daemon App that executes daily to query compliance data from Azure Resource Graph, generates CSV file and save to Azure Storage


### Setup dev machine

* [install Az powershell module](https://learn.microsoft.com/en-us/powershell/azure/install-azps-windows?view=azps-10.3.0&tabs=powershell&pivots=windows-psgallery#installation)
* [Install GuestConfiguration module](https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-set-up-authoring-environment#install-the-module-from-the-powershell-gallery)
