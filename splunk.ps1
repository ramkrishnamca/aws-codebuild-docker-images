$servers = get-content "C:\Users\extadmandas\Desktop\servers.txt"
foreach($server in $servers)
{
Invoke-Command -ComputerName $server -ScriptBlock {
""
"SERVER: $env:COMPUTERNAME"
try {
(New-Object System.Net.Sockets.TcpClient("dkdat1srv765.global.local", 8089)).Connected | Out-Null
(New-Object System.Net.Sockets.TcpClient("dkdat1srv761.global.local", 8089)).Connected | Out-Null
(New-Object System.Net.Sockets.TcpClient("dkdat1srv761.global.local", 9997)).Connected | Out-Null
}
catch {
"Telnet not working"
}

$string = "[target-broker:deploymentServer]
targetUri = dkdat1srv765.global.local:8089"
$string |Set-Content -Path "C:\Program Files\SplunkUniversalForwarder\etc\system\local\deploymentclient.conf"

"Now replaced file content is:"
Get-Content "C:\Program Files\SplunkUniversalForwarder\etc\system\local\deploymentclient.conf"
}
}