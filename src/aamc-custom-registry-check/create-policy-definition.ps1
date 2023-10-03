# create config package artifact
# https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-package#create-a-configuration-package-artifact



$guid = ([guid]::NewGuid()).ToString()
$contentUri = 'https://strguramachineconfig.blob.core.windows.net/aamc/RegistryAssertion.zip?sv=2023-01-03&se=2023-11-02T02%3A47%3A47Z&sr=b&sp=ra&sig=sNl14PKri4LU%2FEFaqBdp%2FD2580gSYrTpsH52p%2B9AblI%3D'

$PolicyParameterInfo = @(
  @{
    Name    = 'Ensure'
    DisplayName          = 'Ensure'
    # Policy parameter description (optional)
    Description          = 'Ensure either Registry Key/ValueData is Present | Absent'
    # DSC configuration resource type (mandatory)
    ResourceType         = 'Registry'
    # DSC configuration resource id (mandatory)
    ResourceId           = 'RegistryAssertion'
    # DSC configuration resource property name (mandatory)
    ResourcePropertyName = 'Ensure'
    
    # Policy parameter default value (optional)
    DefaultValue         = "Present"
    AllowedValues        = @("Present", "Absent")
  },
  @{
    Name    = 'Registry Key'
    DisplayName          = 'Registry Key'
    # Policy parameter description (optional)
    Description          = 'Registry Key'
    # DSC configuration resource type (mandatory)
    ResourceType         = 'Registry'
    # DSC configuration resource id (mandatory)
    ResourceId           = 'RegistryAssertion'
    # DSC configuration resource property name (mandatory)
    ResourcePropertyName = 'Key'
    
    # Policy parameter default value (optional)
    DefaultValue         = ""
    AllowedValues        = @()
  },
  @{
    Name    = 'Registry ValueName'
    DisplayName          = 'Registry ValueName'
    # Policy parameter description (optional)
    Description          = 'Registry ValueName'
    # DSC configuration resource type (mandatory)
    ResourceType         = 'Registry'
    # DSC configuration resource id (mandatory)
    ResourceId           = 'RegistryAssertion'
    # DSC configuration resource property name (mandatory)
    ResourcePropertyName = 'ValueName'
    
    # Policy parameter default value (optional)
    DefaultValue         = ""
    AllowedValues        = @()
  },
  @{
    Name    = 'Registry ValueData'
    DisplayName          = 'Registry ValueData'
    # Policy parameter description (optional)
    Description          = 'Registry ValueData'
    # DSC configuration resource type (mandatory)
    ResourceType         = 'Registry'
    # DSC configuration resource id (mandatory)
    ResourceId           = 'RegistryAssertion'
    # DSC configuration resource property name (mandatory)
    ResourcePropertyName = 'ValueData'
    
    # Policy parameter default value (optional)
    DefaultValue         = ""
    AllowedValues        = @()
  }
)

# ...and then passed into the `New-GuestConfigurationPolicy` cmdlet
$PolicyConfig   = @{
  PolicyId      = $guid
  ContentUri    = $contentUri
  DisplayName   = 'Audit Windows Registry present or absent'
  Description   = 'Audits if a Windows Registry is present or absent'
  Path          = './output'
  Platform      = 'Windows'
  Parameter     = $PolicyParameterInfo
  PolicyVersion = '0.0.1'

}

New-GuestConfigurationPolicy @PolicyConfig