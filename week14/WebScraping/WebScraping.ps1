clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://192.168.3.124/ToBeScraped.html

# Get a count of the links in the page
$scraped_page.Links.Count

clear

# Display links as HTML Element
$scraped_page.Links

clear

# Display only URL and its text
$scraped_page.Links | Select-Object outerText, href 

clear

$h2s=$scraped_page.ParsedHTML.body.getElementsByTagName("h2") | select-Object outerText

$h2s

clear

$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2")

for($i=0; $i -lt $h2s.length; $i++){
$h2s[$i].getElementsByTagName("a") | select `
@{Name="h2 element"; Expression={$i}}, outerText, href
}

clear

# Print innerText of ever div element that has the class as "div-1"
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { `
$_.getAttributeNode("class").Value -ilike "div-1"} | select innerText

$divs1

clear

$trs=$scraped_page.ParsedHtml.body.getElementsByTagName("tr")

$multirow = @()
for($i=1; $i -lt $trs.length; $i++){
$tds=$trs[$i].getElementsByTagName("td")

$singlerow = @(
@{Row=$i; Employee=$tds[0].innerText; Department=$tds[1].innerText; `
Salary=$tds[2].innerText}
)
$multirow += $singlerow
}
$multirow.Values

clear

$average = [int]"0"
for ($i=0; $i -lt $multirow.length; $i++)
{
    $average += $multirow[$i].Salary
}
"Average"
$average /= $trs.length - 1
$average

clear

$ids = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | select id
$ids