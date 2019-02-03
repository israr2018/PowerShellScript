Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$sourceSiteUrl = "http://99sp6/sites/appraisals"
$sourceListName = "Manager Appraisals"
try {


$spSourceSite = Get-SPSite -Identity $sourceSiteUrl
$spSourceWeb=$spSourceSite.RootWeb
$spSourceList =[Microsoft.SharePoint.SPList]$spSourceWeb.Lists[$sourceListName]

#$spSourceItems = $spSourceList.Items | where {$_['ID'] -eq 1392}
$spSourceItems = $spSourceList.Items | where {$_['Appraisal Year'] -eq $null}

$assembly = [Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint");
$type = $assembly.GetType("Microsoft.SharePoint.SPEventManager");
$prop = $type.GetProperty([string]"EventFiringDisabled",[System.Reflection.BindingFlags] ([System.Reflection.BindingFlags]::NonPublic -bor [System.Reflection.BindingFlags]::Static));

    $prop.SetValue($null, $true, $null); #Disable event firing


    $spSourceItems | ForEach-Object {
    Write-Host $_['ID']
    Write-Host $_['Created By']
    $_['Appraisal Year']='2015'
    Write-Host $_['Appraisal Year']
   $_.SystemUpdate($false)
    }

    $prop.SetValue($null, $false, $null);#Enable event firing


}
catch {

        Write-Host "Error occured"


}

