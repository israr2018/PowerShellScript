cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$site= Get-SPSite -Identity http://99sp6/sites/jobreq2
$web= $site.RootWeb
$listEmpChangeForm=$web.Lists["Employment Change Form"]

$listTask=$web.Lists["Tasks"]

$EmpChangeItems= $listEmpChangeForm.Items
$TaskItems=$listTask.Items|Where-Object{$_['Title'] -match ("Emp.* ")}
Write-Host "Updating JobReqNumber  in Task List for Employment Change Form.Please wait...." -BackgroundColor DarkMagenta
foreach($EmpReq in $EmpChangeItems){

$Name=$EmpReq.Name
$ID=$EmpReq.ID
$Name2=$Name.Trim()
foreach($Task in $TaskItems){
$title= $Task.Title

$title2=$title -replace ("Emp.*\s+on","")
$title3=$title2.Trim()

if($Name2 -eq $title3){
Try{

if($Task["JobReqNumber"] -eq  $null){
#Write-Host "Empty JobReqNumber for formID $ID" -BackgroundColor DarkRed
$Task["JobReqNumber"]=$ID

$Task.Update()

}
}
catch{

Write-Host "The  Employement Change  Form with ID :"+$iD -BackgroundColor DarkRed

#Break

}





}


}





}


Write-Host "Task list has been updated with JobReqNumber column"  -BackgroundColor DarkMagenta







