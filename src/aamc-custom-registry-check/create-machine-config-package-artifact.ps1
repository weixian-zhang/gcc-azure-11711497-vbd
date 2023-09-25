# Create a package that will only audit compliance
$params = @{
    Name          = 'RegistryAssertion'
    Configuration = './output/localhost.mof'
    Type          = 'Audit'
    Force         = $true
}
New-GuestConfigurationPackage @params