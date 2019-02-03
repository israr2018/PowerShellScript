cls
Add-PSSnapin "Microsoft.SharePoint.PowerShell"
$solutions=Get-SPSolution |Where-Object {$_.Name -cmatch ("1e.*.wsp*")}
$FolderPath="D:\Solutions"
foreach( $solution in $solutions){

$filename = $Solution.SolutionFile.Name  

echo $filename
 # $solution.SolutionFile.SaveAs("$FolderPath\$filename") 



}