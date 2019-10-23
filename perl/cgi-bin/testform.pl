#!/usr/bin/perl #

# Read and parse input from the web form

read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});

@pairs = split(/&/, $buffer);
foreach $pair (@pairs) {
  ($name, $value) = split(/=/, $pair);
  $value =~ tr/+/ /;
  $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
  $value =~ s/<!--(.|\n)*-->//g;
  $input{$name} = $value;
}

# Save the user output in a file

$targetfile = "var/www/html/work/user.html";

open (NAMEFILE, ">>$targetfile");
print NAMEFILE "<h3>Имя: ",$input{'user_name'},"</h3>\n";
print NAMEFILE "<p><hr><p>\n";
close (NAMEFILE);

# Send a message back to the user
print "Content-Type: text/html\n\n";

print "<h3>Спасибо, что заполнили форму</h3>\nНажмите ";
print '<a href="http://192.168.0.103/work/user.html">сюда</a>';
print ", чтобы увидеть Ваш ввод.\n";
