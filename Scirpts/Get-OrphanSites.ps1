if ( (Get-PSSnapin -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue) -eq $null ) 

 {Add-PSSnapin Microsoft.SharePoint.Powershell}

 set-location "C:\Program Files\Common Files\Microsoft Shared\web server extensions\15\BIN"

 $SPFarm = Get-SPFarm

 $contentWebAppServices = (Get-SPFarm).services | ? {$_.typename -eq "Microsoft SharePoint Foundation Web Application"} 



 foreach ($SPWebApp in $contentWebAppServices.WebApplications)

 {

 foreach ($SPSite in $SPWebApp.Sites)

 {

 Write-Host "Going thru Site Collection" $SPSite.Url

 $SPSite.Url >> D:\backup\OrphanObjects.txt

 stsadm.exe -o databaserepair -url $SPSite.Url -databasename $SPSite.ContentDatabase.Name >> D:\backup\OrphanObjects.txt

 $SPSite.Dispose()

 }}