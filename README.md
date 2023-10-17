### Requirements

1. A custom Azure Automanage Machine Configuration that checks for Registry keys and values in Windows Server,
  against a list of supplied Registry keys/values as parameters through Azure Policy parameters.

2. Daily CSV report of compliance data:
   a cloud native daemon App that executes daily to query compliance data from Azure Resource Graph, generates CSV file and save to Azure Storage


### Setup dev machine

* [Install PowerShell 7](https://github.com/PowerShell/PowerShell/releases/tag/v7.1.3)
* [install Az powershell module](https://learn.microsoft.com/en-us/powershell/azure/install-azps-windows?view=azps-10.3.0&tabs=powershell&pivots=windows-psgallery#installation)
* [Install GuestConfiguration module](https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-set-up-authoring-environment#install-the-module-from-the-powershell-gallery)
* Within PosH scripting environment:
  * Install-Module GuestConfiguration -Verbose -Force
  * Install-Module PSDscResources -Verbose -Force
* Local testing of DSC configuration
  * [set WINRM TrustedHost](https://learn.microsoft.com/en-us/troubleshoot/windows-client/system-management-components/can-not-establish-ps-remote-session-winrm-aad-only-joined-machines#implicit-credentials-cant-be-used)  

  * [Also add default SPN to host](https://learn.microsoft.com/en-us/troubleshoot/windows-client/system-management-components/can-not-establish-ps-remote-session-winrm-aad-only-joined-machines#default-spn-prefix-http-prevents-azure-ad-authentication)

### Steps to create a custom Azure Automanage Machine Configuration
As describe in [Azure doc](https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-policy-definition)

1. create DSC configuration resource
2. create a package artifact (.zip file) which contains the compiled DSC .mof from step 1
3. Upload package artifact .zip to an [Azure Storage or other types of storage](https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-publish-package) of choice
4. create a policy definition
5. publish policy definition
6. assign policy



