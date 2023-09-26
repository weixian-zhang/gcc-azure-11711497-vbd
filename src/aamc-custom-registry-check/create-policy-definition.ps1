# create config package artifact
# https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-package#create-a-configuration-package-artifact

$guid = ([guid]::NewGuid()).ToString()
$contentUri = 'https://strguramachineconfig.blob.core.windows.net/aamc/RegistryAssertion_0.0.1.zip?sp=r&st=2023-09-26T06:14:14Z&se=2023-10-07T14:14:14Z&spr=https&sv=2022-11-02&sr=b&sig=rcZwPRQYEyjat0YHdbSX48uxgmcl3MPQQPWJFxnxnWg%3D'

$PolicyParameterInfo = @(
  @{
    Name    = 'Windows Registry keys and values'
    DisplayName          = 'Windows Registry keys and values'
    # Policy parameter description (optional)
    Description          = 'windows registry key and value to be audited'
    # DSC configuration resource type (mandatory)
    ResourceType         = 'Registry'
    # DSC configuration resource id (mandatory)
    ResourceId           = 'RegistryAssertion'
    # DSC configuration resource property name (mandatory)
    ResourcePropertyName = 'Key'
    Type = 'Array'
    # Policy parameter default value (optional)
    DefaultValue         = '{"registries":[]}'
    # Policy parameter allowed values (optional)
    AllowedValues        = @()
  })

# ...and then passed into the `New-GuestConfigurationPolicy` cmdlet
$PolicyConfig   = @{
  PolicyId      = $guid
  ContentUri    = $contentUri
  DisplayName   = 'Windows Registry Present or Absent'
  Description   = 'Asserts and audits against a list of supplied Windows Registry keys and values as parameters. Parameter in Json example:{    "registries": [{"Key" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\7-Zip","ValueName" : "Path","ValueData"   : "C:\\Program Files\\7-Zip","Ensure"  : "Present", "Hex":false}    ] }'
  Path          = './output'
  Platform      = 'Windows'
  Parameter     = $PolicyParameterInfo
  PolicyVersion = '0.0.1'

}

New-GuestConfigurationPolicy @PolicyConfig