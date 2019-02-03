cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite -Identity http://99sp6/sites/jobreq2
$web= $site.RootWeb
$listJobReq=$web.Lists["Job Requisition Form"]

$listTask=$web.Lists["Tasks"]

#$itemsinJobReqList= $listJobReq.GetItems()|Where-Object{$_['ID']-eq "4684"}
$item3=$listJobReq.GetItemById("4684")
$Name=$item3.Name
$ID=$item3.ID
$Name2=$Name3.Trim()

Write-Host ("ID is equal "+$ID)





$items2=$listTask.Items|Where-Object{$_['Title'] -match ("Job.* ")}

foreach($item2 in $items2){


$title= $item2.Title

$title2=$title -replace ("Job.*\s+on","")
$title3=$title2.Trim()


Write-Host ($title3)
if($Name2 -eq $title3){

Write-Host "we hava matche" -BackgroundColor DarkRed
$item2["JobReqNumber"]=$ID
$item2.Update()
break
}


}
