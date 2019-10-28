#!/usr/bin/perl
use strict; 
use warnings;

# скрипт для збереження даних в окремий файл file.txt
use CGI;
 print "Content-Type: text/html\n\n";
my $filename = 'file.txt';
open(my $fh, '+>', $filename) or die "Can`t open '$filename' $!";
 $my_cgi = new CGI;
 $your_name = $my_cgi->param('name');
 $your_location = $my_cgi->param('location');
 $your_email = $my_cgi->param('email');
 print $fh " name: $your_name\n location: $your_location\n email: $your_email\n$
 close($fh);
