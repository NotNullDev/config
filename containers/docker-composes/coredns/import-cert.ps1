# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/about/about_certificate_provider?view=powershell-7.2
Import-Certificate -FilePath "./gitlab.example.com" -CertStoreLocation Cert:\CurrentUser\Trust
