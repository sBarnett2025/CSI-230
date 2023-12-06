clear
$url = "https://classlist.champlain.edu/show/courses/semester/spring/type/dayevening"

# Start Internet Explorer Object
$ie = New-Object -ComObject internetexplorer.application
$ie.navigate($url)
$ie.visible=$true
while($ie.ReadyState -ne  4) {start-sleep -s 10}

$FullTable

$trs=$ie.Document.getElementsByTagName("tr") # Get every row

for($i=1; $i -lt $trs.length; $i++){ # for every row
$tds = $trs[$i].getElementsByTagName("td") # Get Every column

$FullTable += [pscustomobject]@{    "Number" = $tds[0].innerText; `
                                     "Title" = $tds[1].innerText; `
                                      "Days" = $tds[4].innerText; `
                                     "Times" = $tds[5].innerText; `
                                "Instructor" = $tds[6].innerText; `
                                }
}
$ie.Quit()

# Get every CSI course
$FullTable | select "Number", Instructor, Days, Times | where { $_.Number -ilike "CSI*" }

# Get every CSI course
#$FullTable | select "Number", Instructor, Days, Times | where { $_.Number -ilike "*200*" }

# Get every 300 Level CSI course that is taught Wednesdays
#$FullTable | select "Number", Instructor, Days, Times | where { ($_.Number -ilike "*300*") -and ($_.Days -ilike "*W*") }

# Get every CSI course that is taught by Staff
#$FullTable | select "Number", Instructor, Days, Times | where { ($_.Number -ilike "*CSI*") -and ($_.Instructor -ilike "*Staff*") }

# Print Number, Title, Instructor, Days for every course that include the String Programming in Title
#$FullTable | select "Number", Title, Instructor, Days | where { $_.Title -ilike "*Programming*" }