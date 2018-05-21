





Function Invoke-ADPortScan {

Import-Module NetTCPIP


$hostname=read-host "Enter Hostname"


$Ports = 
('139','User and Computer Authentication, Replication','DFSN, NetBIOS Session Service, NetLogon'),
('137', 'User and Computer Authentication','NetLogon, NetBIOS Name Resolution'),
('67','DHCP','DHCP' ),
('2535','DHCP','DHCP'),
('9389','AD DS Web Services','SOAP'),
('138','DFS, Group Policy','DFSN, NetLogon, NetBIOS Datagram Service'),
('464','Replication, User and Computer Authentication, Trusts','Kerberos change/set password'),
('123', 'Windows Time, Trusts', 'Windows Time'),
('5722', 'File Replication', 'RPC, DFSR (SYSVOL'),
('135', 'Replication', 'RPC, EPM'),
('25', 'Replication', 'SMTP'),
('445', 'Replication, User and Computer Authentication, Group Policy, Trusts', 'SMB,CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc'),
('53', 'User and Computer Authentication, Name Resolution, Trusts', 'DNS'),
('88', 'User and Computer Authentication, Forest Level Trusts', 'Kerberos'),
('3268', 'Directory, Replication, User and Computer Authentication, Group Policy, Trusts', 'LDAP GC'),
('3269', 'Directory, Replication, User and Computer Authentication, Group Policy, Trusts', 'LDAP GC SSL'),
('389', 'Directory, Replication, User and Computer Authentication, Group Policy, Trusts', 'LDAP'),
('636', 'Directory, Replication, User and Computer Authentication, Group Policy, Trusts', 'LDAP SSL') |  ForEach-Object {[pscustomobject]@{Port = $_[0]; "PortUsage" = $_[1]; TrafficType = $_[2]}}






$ports | foreach {$port = $_.port;$portusage=$_.PortUsage;$traffictype=$_.TrafficType;Test-NetConnection -computer $hostname -Port $port | select @{name="Hostname";expression={$hostname}},@{name="Port";expression={$port}},@{name="Port Usage";expression={$PortUsage}} ,@{name="Traffic Type";expression={$traffictype}},@{name="Port Is Open";expression={$_.TcpTestSucceeded}  } | Export-Csv "c:\temp\ADPorts.csv" -Append -Force -NoTypeInformation }










} 

$Net = $null
$_ = $null
$Range = 1024..65535 | foreach {$net + $_ }
$Results = $Range | foreach {
Test-NetConnection -ComputerName localhost -Port $_ }
