# create config package artifact
# https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-package#create-a-configuration-package-artifact

$guid = ([guid]::NewGuid()).ToString()
$contentUri = 'https://strguramachineconfig.blob.core.windows.net/aamc/RegistryAssertion_0.0.1.zip?sp=r&st=2023-09-26T06:14:14Z&se=2023-10-07T14:14:14Z&spr=https&sv=2022-11-02&sr=b&sig=rcZwPRQYEyjat0YHdbSX48uxgmcl3MPQQPWJFxnxnWg%3D'

$PolicyParameterInfo = @(
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
  },
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
    Name    = "Hex"
    DisplayName          = 'Is Value Hex'
    # Policy parameter description (optional)
    Description          = 'is the registry value data a hexidecimal value'
    # DSC configuration resource type (mandatory)
    ResourceType         = 'Registry'
    # DSC configuration resource id (mandatory)
    ResourceId           = 'RegistryAssertion'
    # DSC configuration resource property name (mandatory)
    ResourcePropertyName = 'Hex'
    Type                 = 'boolean'
    # Policy parameter default value (optional)
    DefaultValue         = $false
    AllowedValues        = @($true, $false)
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