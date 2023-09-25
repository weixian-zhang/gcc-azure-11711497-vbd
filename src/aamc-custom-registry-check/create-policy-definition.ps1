# create config package artifact
# https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-package#create-a-configuration-package-artifact

$guid = ([guid]::NewGuid()).ToString()

# 
$PolicyParameterInfo = @(
  @{
    # Policy parameter name (mandatory)
    Key                 = ''    # registry key
    Value               = ''    # registry value
    Ensure         = 'Present'    # ensure if registry is Present | Absent
  })

# ...and then passed into the `New-GuestConfigurationPolicy` cmdlet
$PolicyConfig      = @{
  PolicyId      = $guid
  ContentUri    = $contentUri
  DisplayName   = 'My audit policy'
  Description   = 'My audit policy'
  Path          = './output/audit-registry-new-policy-definition.json'
  Platform      = 'Windows'
  Parameter     = $PolicyParameterInfo
  PolicyVersion = 0.0.1
}

New-GuestConfigurationPolicy @PolicyConfig