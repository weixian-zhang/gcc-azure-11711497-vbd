Set-Location -Path 'C:\Weixian\Projects\Azure-GCC\gcc-azure-11711497-vbd\src\aamc-custom-registry-check\'

$packageFileName = "RegistryAssertion.zip"
$packagePath = "./output/$($packageFileName)"

$storageName = 'strguramachineconfig'
$rg = 'rg-ura-vbd-aamc'
$containerName = 'aamc'


Connect-AzAccount

$storage = Get-AzStorageAccount -Name $storageName -ResourceGroupName $rg

$blob = @{
    File             = $packagePath
    Container        = $containerName
    Blob             = $packageFileName
    Context          = $storage.Context
    StandardBlobTier = 'Hot'
  }


Set-AzStorageBlobContent @blob -Force

$sasToken = New-AzStorageBlobSASToken -Context $storage.Context `
    -Container $containerName `
    -Blob $packageFileName `
    -Permission ra `
    -ExpiryTime (Get-Date).AddDays(30)

$sasUrl = "https://$($storageName).blob.core.windows.net/aamc/$($packageFileName)$($sasToken)"

Write-Output $sasUrl
