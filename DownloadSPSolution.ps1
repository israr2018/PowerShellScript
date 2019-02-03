$FolderPath = "D:\Solutions"  
foreach ($solution in Get-SPSolution)  
{  
   $id = $Solution.SolutionID  
   $title = $Solution.Name  
   $filename = $Solution.SolutionFile.Name  
   $solution.SolutionFile.SaveAs("$FolderPath\$filename")  
}  