cls
Add-PSSnapin Microsoft.SharePoint.PowerShell
$SolutionPackageName="employment change form workflow.wsp"
$SolutionId="07fddf08-b63c-443e-a698-9c44bc88f460"
$SolutionPackagePath=""
# ensure previous version of the Solution is already deployed
$solution=Get-SPSolution |Where-Object {$_.Name -eq $SolutionPackageName}
if( $solution -ne $null){

if($solution.Deployed -eq $true){

Write-Host (" Updatating  the  $SolutionPackageName  wait plz.")
Update-SPSolution -Identity $SolutionPackageName -LiteralPath 'C:\Users\ihaq\Desktop\EmployeeChangeWF\SP2013 EmploymentChange\EmpChangeWFV2_DeploymentPackage\Employment Change Form Workflow.wsp' -Local -GACDeployment
Write-Host ("The package   $SolutionPackageName  is updated successfully.")

}
else{

Write-Host ("$SolutionPackageName is not deoployed")

}


}