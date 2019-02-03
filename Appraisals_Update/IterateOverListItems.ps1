cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction Ignore

[System.reflection.assembly]::LoadWithPartialName("Microsoft.SharePoint")
$siteUrl="http://99sp6/sites/appraisals"
$site=new-object Microsoft.SharePoint.SPSite($siteUrl)
$web=$site.OpenWeb()
$webApp=Get-SPWebApplication -Identity  http://99sp6/


#$webApp = $db.WebApplication


if($webApp -eq $null){


echo "It is null"

}

$user = $env:USERDOMAIN+"\"+$env:USERNAME
Echo $user
$webApp.GrantAccessToProcessIdentity($user)

Try {

    echo " ::Do some work..."
    
    $listTask=$web.Lists["Manager Appraisals"]
    $Taskitems = $listTask.Items| Where-Object{$_["Appraial Year"] -eq $null} 
    foreach ($item  in $Taskitems){
      echo $item.Name
   
    }
    
   }
 Catch {
            Write-Host($_.Exception.Message)
            # echo "  ::Cannot handle the error (will rethrow): $_.Exception.Message"
            throw $_
} 
Finally 
{
    echo " ::Cleanup resources..."
    $web.Dispose()
    $site.Dispose()
}