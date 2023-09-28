# Create a machine config package that will only audit compliance

$params = @{
    Name          = 'RegistryAssertion'
    Configuration = './output'
    Type          = 'Audit'
    Force         = $true
    Version       = "0.0.1"
}
New-GuestConfigurationPackage @params



