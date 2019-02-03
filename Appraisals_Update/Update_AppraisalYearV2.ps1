Add-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue
$sourceSiteUrl = "http://99sp6/sites/appraisals"
$sourceListName = "Manager Appraisals"
try {

    $site=new-object Microsoft.SharePoint.SPSite($siteUrl)
    $web=$site.OpenWeb()
    
    $spSourceList=$web.Lists[$sourceListName]
    $spSourceItems =  $spSourceList.Items | where {$_['ID'] -eq 1392}
   
    #$spSourceItems = [Microsoft.SharePoint.SPListItems]$spSourceList.Items | where {$_['Appraisal Year'] -eq $null} 

    $assembly = [Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint");
    $type = $assembly.GetType("Microsoft.SharePoint.SPEventManager");
    $prop = $type.GetProperty([string]"EventFiringDisabled",[System.Reflection.BindingFlags] ([System.Reflection.BindingFlags]::NonPublic -bor [System.Reflection.BindingFlags]::Static));

    $prop.SetValue($null, $true, $null); #Disable event firing
    
    foreach( $item in $spSourceItems){
    [SPListItem]$myItem=$item
    $item["Appraisal Year"]=2015
    
    Echo "ID = $($myItem['ID'])    "
    Echo "Befor update Appraisal Year = $($myItem['Appraisal Year'])" 
    $myItem.SystemUpdate($false)
     Echo "Appraisal Year = $($myItem['Appraisal Year'])" 
    
    }
    
    

    $prop.SetValue($null, $false, $null) #Enable event firing

   }

Catch{

        Write-Host "Error occured"
        throw $_
        


}
finally{

$web.Dispose()


}

