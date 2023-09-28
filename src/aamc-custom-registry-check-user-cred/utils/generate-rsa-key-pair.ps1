$store = "Cert:\LocalMachine\My"

$params = @{
 CertStoreLocation = $store
 Subject = "CN=AzAutomationMachineConfigMofCert"
 KeyLength = 2048
 KeyAlgorithm = "RSA" 
 KeyUsage = "DataEncipherment"
 Type = "DocumentEncryptionCert"
}

$privateKey = "C:\Users\weixzha\Desktop\mof-protect.pfx"
$publicKey = "C:\Users\weixzha\Desktop\mof-protect.cer"

# generate new certificate and add it to certificate store
$cert = New-SelfSignedCertificate @params


# list all certs 
# Get-ChildItem -path $store

# Encryption / Decryption

$message = "AzAutomationMachineConfigMofCert"

$cipher = $message  | Protect-CmsMessage -To "CN=AzAutomationMachineConfigMofCert" 
Write-Host "Cipher:" -ForegroundColor Green
$cipher

Write-Host "Decrypted message:" -ForegroundColor Green
$cipher | Unprotect-CmsMessage


# Exporting/Importing certificate

$pwd = ("P@ssword" | ConvertTo-SecureString -AsPlainText -Force)


# Export private key as PFX certificate, to use those Keys on different machine/user
Export-PfxCertificate -FilePath $privateKey -Cert $cert -Password $pwd

# Export Public key, to share with other users
Export-Certificate -FilePath $publicKey -Cert $cert

#Remove certificate from store
$cert | Remove-Item

# Add them back:
# Add private key on your machine
Import-PfxCertificate -FilePath $privateKey -CertStoreLocation $store -Password $pwd

# This is for other users (so they can send you encrypted messages)
Import-Certificate -FilePath $publicKey -CertStoreLocation $store