#!/usr/bin/env perl    
### change the
sub p_inc {
  $DateiName = shift;
    if ( open (my $datei, "$DateiName.tex") ) {
      print "%%%---------- open: ", $DateiName, "\n";
      while (<$datei>) {
        if ((/^\s*\\include{\s+(\S+)/i) or (/^\s*\\input{\s+(\S+)/i)) {
          my $include = $1;
          chomp($include);chop($include);
          print "%%%%%%%%% jump to ", $include, "\n";
          p_inc($include);
        } else { print unless /^\s*(#|$)/; }
      }
      print "%%%---------- close: ", $DateiName, "\n";
      close $datei;
    } else { print "%%%<===== file soesn't exist\n"; }
}
#
@zeilen = (<>);
for $zeile (@zeilen) {
  next if $zeile =~ /^\s*(%)/;
  if (($zeile =~ /^\s*\\include{\s*(\S+)/i) or ($zeile =~ /^\s*\\input{\s*(\S+)/i)) {      
    my $include = $1;
    chomp($include);
    chop($include);
    print "%%%%%%%%%%% jump to ", $include, "\n";
    p_inc($include);
  } else { print $zeile; }
} 
