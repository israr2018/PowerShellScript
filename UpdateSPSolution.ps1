cls
Add-PSSnapin Microsoft.SharePoint.PowerShell
$SolutionPackageName="jobrequisitionworkflow.wsp"
$SolutionId="2db943d6-905c-4ad5-b2ee-88d4215ff688"
$SolutionPackagePath=""
# ensure previous version of the Solution is already deployed
$solution=Get-SPSolution |Where-Object {$_.Name -eq $SolutionPackageName}
if( $solution -ne $null){

if($solution.Deployed -eq $true){

Write-Host (" Updatating  the  $SolutionPackageName  wait plz.")
Update-SPSolution -Identity $SolutionPackageName -LiteralPath C:\Users\ihaq\Desktop\JobReqWF\JobReqWFV2\JobRequisitionWorkflow.wsp -Local -GACDeployment
Write-Host ("The package   $SolutionPackageName  is updated successfully.")

}
else{

Write-Host ("$SolutionPackageName is not deoployed")

}


}