

cls

$site = Get-SPSite http://99sp6/sites/appraisals

$groups = $site.RootWeb.sitegroups

foreach ($grp in $groups) 
{"Group: " + $grp.name; 
    foreach ($user in $grp.users) 
    {
    if($user.Name -ceq "Suzi Rodrigues"){

    Write-Host $user.Name
    
    
    }

    } 
}

$site.Dispose()