Add-PSSnapin microsoft.sharepoint.powershell -ErrorAction SilentlyContinue
 
#Variables for Web URL, List Name
$WebURL ="http://99sp6/sites/appraisals"
$ListName ="Manager Appraisals"
Try{
#Get the list items with Unique permissions
$Site= Get-SPSite $WebURL
$Web=$Site.OpenWeb()
$List =$Web.lists.TryGetList($ListName)
$ListItems=$List.Items | Where {$_.HasUniqueRoleAssignments}
 
# If List Exists with Unique permission
Foreach($ListItem in $ListItems)
 {
      #Reset broken list item inheritance
       $ListItem.ResetRoleInheritance()
      Write-host "Broken Inheritance Reset on List Item:" $ListItem.URL
 }
 }
 Catch{
 echo " Exception ocurred"
 throw $_
 
 
 }
 Finally{
 
 $Web.Dispose()

 
 }


