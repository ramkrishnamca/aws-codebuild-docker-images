$servers = get-content "C:\Users\extadmandas\Desktop\servers.txt"
foreach($server in $servers)
 {
   echo $server >> "C:\Users\extadmandas\Desktop\ortoutput.txt"
   Test-Connection $server -count 1 | select Address,Ipv4Address >> "C:\Users\extadmandas\Desktop\ortoutput.txt"
   Get-Service -name HealthService,SnowInventoryAgent5,SplunkForwarder -ComputerName $server >> "C:\Users\extadmandas\Desktop\ortoutput.txt"
  }