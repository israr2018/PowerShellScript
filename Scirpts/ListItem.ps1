Add-PSSnapin microsoft.sharepoint.powershell -ErrorAction SilentlyContinue
 
#Variables for Web URL, List Name
$WebURL ="http://99sp6/sites/appraisals/"
$ListName ="Manager Appraisals"
 
#Get the list items with Unique permissions
$ListItems = (Get-SPweb $WebURL).lists.TryGetList($ListName).Items | Where {$_.HasUniqueRoleAssignments}
 
# If List Exists with Unique permission
Foreach($ListItem in $ListItems)
 {
      #Reset broken list item inheritance
       $ListItem.ResetRoleInheritance()
      Write-host "Broken Inheritance Reset on List Item:" $ListItem.URL
 }


