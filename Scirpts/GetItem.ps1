

Funtion GetItem{


param($ListName,$ColumnName,$ColumnEntry,$SiteUrl)
$SiteList="http://sp2013dev/sites/dps"
$Web2=Get-SPWeb -Identity $SiteURL
$ListName="DpsStaff"

$List=$Web2.Lists[$ListName]

$Items=$List.Items
foreach($item in $Items){

Write-Host ($item["Title"])
if ($item["Title"] -eq "Falcon199"){

Write-Host ("Hi We have a match")
break;
}
}


retun $item
}