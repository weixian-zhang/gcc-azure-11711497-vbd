# Create a package that will only audit compliance
$params = @{
    Name          = 'RegistryAssertion'
    Configuration = './output/localhost.mof'
    Type          = 'Audit'
    Force         = $true
    Version       = "0.0.1"
}
New-GuestConfigurationPackage @params