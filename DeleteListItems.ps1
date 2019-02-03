Add-PSSnapin "Microsoft.SharePoint.PowerShell"
 
#Variables for Web URL, List Name
$WebURL ="http://99sp6/sites/coding"


#Get the list items with Unique permissions
$Site= Get-SPSite $WebURL
$Web=$Site.OpenWeb()
$List =$Web.Lists|Where-Object{$_.title -eq "ErrorLogList"}

 $Items=$List.items

 foreach($item in $Items){
 
 Write-Host "Say Godbye to $($item.ID) "-ForegroundColor red
 $List.GetItemById($item.ID).Delete()
 
 
 }



