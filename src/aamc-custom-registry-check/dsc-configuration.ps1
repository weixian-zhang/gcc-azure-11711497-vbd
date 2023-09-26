$outputPath = './output/'

Configuration RegistryAssertion
{
    # default parameters will be override by policy definition as documented in below link
    # https://learn.microsoft.com/en-us/azure/governance/machine-configuration/how-to-create-policy-definition#using-parameters-in-custom-machine-configuration-policy-definitions
    # param
    # (
    #     [Parameter(Mandatory=$true)]
    #     [String]
    #     $Registries = '{    "registries": [        {"Key" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\7-Zip","ValueName" : "Path","ValueData"   : "C:\\Program Files\\7-Zip","Ensure"  : "Present", "Hex":    false        },        {"Key" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\Adobe\\Installer","ValueName" : "UWP_APP_PACKAGE_FULLNAME","ValueData" : "ReaderNotificationClient_1.0.4.0_x86__e1rzdqpraam7r","Ensure"  : "Present", "Hex":    false        }    ]}'
    # )
    
    Import-DscResource -ModuleName PSDscResources

    Node localhost {
        Registry RegistryAssertion
        {
            Ensure      = 'Present'
            Key         = 'HKEY_LOCAL_MACHINE\SOFTWARE\7-Zip'
            ValueName   = 'Path'
            ValueData   = 'C:\Program Files\7-Zip\'
            Hex         = $false
        }
    }
}

RegistryAssertion -OutputPath $outputPath -Verbose


# param example
# {
#     "registries": [
#         {
#             "Key" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\7-Zip",
#             "ValueName" : "Path",
#             "ValueData"   : "C:\\Program Files\\7-Zip",
#             "Ensure"  : "Present",
#              "Hex":    false
#         },
#         {
#             "Key" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\Adobe\\Installer",
#             "ValueName" : "UWP_APP_PACKAGE_FULLNAME",
#             "ValueData" : "ReaderNotificationClient_1.0.4.0_x86__e1rzdqpraam7r",
#             "Ensure"  : "Present",
#              "Hex":    false
#         }
#     ]
# }



