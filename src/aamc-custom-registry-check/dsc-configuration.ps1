$outputPath = './output/'

# credential needed for HKCU key
# https://stackoverflow.com/questions/42124923/configuring-hkey-current-user-with-dsc-resource-actually-updates-hkey-users-def

Configuration RegistryAssertion
{
    Import-DscResource -ModuleName PSDscResources

   
    Registry RegistryAssertion
    {
        Ensure      = 'Present'
        Key         = 'HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\KeyboardClass'
        ValueName   = '\Device\KeyboardClass0'
        ValueData   = '\REGISTRY\MACHINE\SYSTEM\ControlSet001\Services\kbdclass'        
    }
}

`
RegistryAssertion -OutputPath $outputPath -Verbose



