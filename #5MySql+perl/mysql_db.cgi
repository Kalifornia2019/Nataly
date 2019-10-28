#!/usr/bin/perl
use strict; 
use warnings;

use DBI;

#Змінні-параметри підключення до бази данних
my $host = "localhost";
my $port = "80";

my $user = "root";
my $pass = "9101984dvir";

my $db = "perl";

print "Content-type: text/html\n\n";

#Підключення до БД
$dbh = DBI->connect("DBI:mysql:$db:$host:$port",
$user,$pass);

$sql = $dbh->prepare("select * from users");

$out = $sql->execute()
or die "Невозможно выполнить sql: $sql->errstr";



print "<center><h1>Table database users</h1>";

# створення заголовку
print <<SUITE;

<center>
<TABLE BORDER=>
<tr bgcolor=#A1C4EE>
<th width=60 align=CENTER><font color=#000000> Id </font></th>
<th width=110 align=CENTER><font color=#000000> Name </font></th>
<th width=110 align=CENTER><font color=#000000> Address </font></th>
<th width=110 align=CENTER><font color=#000000> Email </font></th>
                </tr>

SUITE

# Цикл для зчитування данних з БД
while( ($id,$name,$address,$email)
=$sql->fetchrow() ) {
print "<tr>";
print "<td width=60 bgcolor=#FFFFE8 align=center> $id</td&gt>";
print "<td width=110 bgcolor=#FFFFE8 align=left> $name</td>";
print "<td width=110 bgcolor=#FFFFE8 align=left> $address</td>";
print "<td width=110 bgcolor=#FFFFE8 align=left> $email</td>";;
print "</tr>";

        }

$rc = $sql->finish;     # закрываем
$rc = $dbh->disconnect; # соединение 


