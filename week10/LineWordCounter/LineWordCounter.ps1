clear

cd "C:\Users\champuser\CSI-230"
$FilesToLookAt = Get-ChildItem -Recurse -Filter "*.bash"

for ($i=0; $i -lt $FilesToLookAt.count; $i++)
{
    Get-Content $FilesToLookAt[$i].FullName | Measure-Object -Line -Word
}