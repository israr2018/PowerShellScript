cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$siteUrl="http://99sp6/sites/appraisals"
$site=New-Object Microsoft.SharePoint.SPSite($siteUrl)
$web=$site.OpenWeb();
$list=$web.Lists["Manager Appraisals"]
$user=Get-SPUser -Web "http://99sp6/sites/appraisals" -Limit "All"|Where-Object{$_.Name -match ("spuser2")}
Write-Host ("User id:"+$user.ID+"  Display name:"+$user.DisplayName+"  Login name:"+$user.LoginName)


if($user -eq  $null){
Write-Host(" $user is null")

}
else{

Write-Host ("Not null")

}


try{

$list.BreakRoleInheritance($false)

}
catch
{
Write-Host ("Err occure.")

}

try{

Write-Host "Id:"$user.ID

$list.RoleAssignments.RemoveById($user.ID)

Write-Host("All role assignments on list name "+$list.EntityTypeName +"for user "+$user.Name +"was removed Successfully")


}
catch{
$errorMessage=$_.Exception.Message
Write-Host ("Erro messaage :"+$errorMessage)

}


