# uBlock Origin - Shitty Copy-Paste websites filter

Filter for uBlock origin to remove spam-website results from DuckDuckGo, Google, and a Searx instance that just blatantly copy and paste content from well known websites.

This list is just a personal collection of annoying, unhelpful websites.

## Generate custom list

1. Run `.\Add-CustomerLists.ps1`

## Generate the combined list

1. Run `.\Join-Lists`

## Extend custom lists

1. Add new object to `Add-CustomerLists.ps1` e.g.

```
[pscustomobject] @{
    FileNameSuffix = 'search-engine-name'
    FilterSelector = "searchEngine.com###urls > article:has(a[href*=`"$ReplaceValue`"])" 
}
``` 

| Property Name    | Notes                                                                                                                                                                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `FileNameSuffix` | Name that will be added to the filename of the filter list. e.g. github-copycats.txt -> github-copycats-**search-engine-name**.txt                                                                                                                    |
| `FilterSelector` | If the search engine is host under a subdomain (like **searchEngine**.myWebsite.com) you need to included in the `FilterSelector`. Make sure that your filter rule contains `$ReplaceValue`. This value will be replace with the urls form the lists. |


## Import into uBlock Origin

1. Open uBlock Origin settings
2. Open the tab Filter lists and scroll all the way down
3. In the `custom` section press `Import` and add the URL `https://raw.githubusercontent.com/DayvidKnows/ublock-origin-shitty-copies-filter/main/combined-list.txt`
4. Press `Apply Changes` in the top left and optionally `Update now`

## Adding URL's 

You can always do a pull-request or just start an issue. If you want different things then I do... fork it!

## Sources

* [Quenhus Stackoverflow/Github copy-cats](https://gist.github.com/quenhus/6bd2c47e5780f726f0c96c0a2ee762a4)
* [uBlacklist - Pinterest](https://raw.githubusercontent.com/rjaus/ublacklist-pinterest/)