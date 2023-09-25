

Configuration RegistryAssertion
{
    # parameters will be override by policy definition as documented in below link
    # https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-policy-definition#using-parameters-in-custom-machine-configuration-policy-definitions
    param
    (
        [Parameter(Mandatory=$false)]
        [PSCustomObject[]] $Registries =  @(
            @{
                Key     = "HKEY\2"
                Value   = "1"
                Ensure  = "Present"
            },
            @{
                Key     = "HKEY\1"
                Value   = "1"
                Ensure  = "Present"
            }
        )
    )
    
    
   Import-DscResource -ModuleName PSDscResources
    #Import-DscResource -Name 'Registry' -ModuleName 'PSDscResources'
    
    $i = 0
    Node WindowsServerRegistryAssertion {
        foreach ($reg in $Registries)
        {       
        
    
            Registry "RegistryAssertion_$($i.ToString())"
            {
                Ensure      = $reg.Ensure
                Key         = $reg.Key
                ValueName   = $reg.Value
            }

            $i += 1
        }
    }
}

RegistryAssertion

