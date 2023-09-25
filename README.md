## Requirements

1. A custom Azure Automanage Machine Configuration that checks for Registry keys and values in Windows Server,
  against a list of supplied Registry keys/values as parameters through Azure Policy parameters.

2. Daily CSV report of compliance data:
   a cloud native daemon App that executes daily to query compliance data from Azure Resource Graph, generates CSV file and save to Azure Storage


## Local testing of DSC configuration

* [set WINRM TrustedHost](https://learn.microsoft.com/en-us/troubleshoot/windows-client/system-management-components/can-not-establish-ps-remote-session-winrm-aad-only-joined-machines#implicit-credentials-cant-be-used)  

* [Also add default SPN to host](https://learn.microsoft.com/en-us/troubleshoot/windows-client/system-management-components/can-not-establish-ps-remote-session-winrm-aad-only-joined-machines#default-spn-prefix-http-prevents-azure-ad-authentication)
