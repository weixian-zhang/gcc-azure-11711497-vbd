

Configuration RegistryAssertion
{
    # parameters will be override by policy definition as documented in below link
    # https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-policy-definition#using-parameters-in-custom-machine-configuration-policy-definitions
    param
    (
        [Parameter(Mandatory=$false)]
        [PSCustomObject[]] $Registries =  @(
            @{
                Key     = "HKEY_LOCAL_MACHINE\SOFTWARE\7-Zip"
                ValueName = "Path"
                ValueData   = "C:\Program Files\7-Zip\"
                Ensure  = "Present"
            },
            @{
                Key     = "HKEY_LOCAL_MACHINE\SOFTWARE\Adobe\Installer"
                ValueName = "UWP_APP_PACKAGE_FULLNAME"
                ValueData   = "ReaderNotificationClient_1.0.4.0_x86__e1rzdqpraam7r"
                Ensure  = "Present"
            }
        )
    )
    
    
   Import-DscResource -ModuleName PSDscResources
    #Import-DscResource -Name 'Registry' -ModuleName 'PSDscResources'
    
    $i = 0
    Node localhost {
        foreach ($reg in $Registries)
        {       
        
    
            Registry "RegistryAssertion_$($i.ToString())"
            {
                Ensure      = $reg.Ensure
                Key         = $reg.Key
                ValueName   = $reg.ValueName
                ValueData   = $reg.ValueData
            }

            $i += 1
        }
    }
}

RegistryAssertion -OutputPath ./output -Verbose;

