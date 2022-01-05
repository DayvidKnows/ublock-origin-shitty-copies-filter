$UrlLists = @('github-copycats.txt', 'stackoverflow-copycats.txt')

$ReplaceValue = 'EVIL-URL'
$SearchEngines = @(
    [pscustomobject] @{
        FileNameSuffix = 'searx-tiekoetter'
        FilterSelector = "searx.tiekoetter.com###urls > article:has(a[href*=`"$ReplaceValue`"])" 
    }
)

foreach ($list in $UrlLists) {
    $urls = Get-Content "$PSScriptRoot\$list"
    $listName = Split-Path $list -LeafBase

    foreach ($engine in $SearchEngines) {
        $filter = $urls | ForEach-Object { $engine.FilterSelector -creplace $ReplaceValue, $PSItem }
        
        $engineName = $engine.FileNameSuffix
        Set-Content "$PSScriptRoot\$listName-$engineName.txt" $filter
    }
}
