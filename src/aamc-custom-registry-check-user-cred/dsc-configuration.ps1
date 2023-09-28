$outputPath = './output/'

# credential needed for HKCU key
# https://stackoverflow.com/questions/42124923/configuring-hkey-current-user-with-dsc-resource-actually-updates-hkey-users-def

Configuration RegistryAssertion
{
    param(
    [PSCredential]$VMCred
    )

    Import-DscResource -ModuleName PSDscResources

    Node $AllNodes.NodeName
    {
        Registry RegistryAssertion
        {
            Ensure      = 'Present'
            Key         = 'HKEY_CURRENT_USER\Software\7-Zip'
            ValueName   = 'Path'
            ValueData   = 'C:\Program Files\7-Zip\'
            PsDscRunAsCredential =   $VMCred
            
        }

        LocalConfigurationManager {
            CertificateID = $node.Thumbprint
        }
    }
    
}

$ConfigurationData = @{
    AllNodes = @(
        @{
            #the "*" means "all nodes named in ConfigData" so we don't have to repeat ourselves
            NodeName="localhost"
            CertificateFile = ".\utils\mof-protect.cer"
            Thumbprint = "60af4b03d1b881bdb2a3fc2409f03d0578a327e6"
        })
}

RegistryAssertion -OutputPath $outputPath -ConfigurationData $ConfigurationData -VMCred Get-Credential -Verbose



