# Create a package that will only audit compliance
$params = @{
    Name          = 'RegistryAssertion'
    Configuration = './RegistryAssertion/WindowsServerRegistryAssertion.mof'
    Type          = 'Audit'
    Force         = $true
}
New-GuestConfigurationPackage @params