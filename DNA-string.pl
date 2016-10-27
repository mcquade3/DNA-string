#!/usr/local/bin/perl
# Mike McQuade
# DNA-string.pl
# Computes the string value of a DNA integer.

use strict;
use warnings;
use integer;

# Open the file to read
open(my $fh,"<ba1m.txt") or die $!;

# Pass in the strings from the file
my $index = <$fh>;
my $k = <$fh>;
chomp($index);
chomp($k);

# Print out the result of the subroutine
print numToPattern($index,$k);

# Close the file
close($fh) || die "Couldn't close file properly";



# Recursively determines the DNA string value
# one number of the index at a time
sub numToPattern {
	my $index = $_[0];
	my $k = $_[1];
	
	if ($k == 1) {return numToSymbol($index);}
	my $prefixIndex = $index/4;
	my $r = $index % 4;
	my $symbol = numToSymbol($r);
	my $prefixPattern = numToPattern($prefixIndex,$k-1);
	return $prefixPattern.$symbol;
}

# Returns an integer value for a given symbol
sub numToSymbol {
	my $num = $_[0];
	
	if ($num == 0) {return 'A';}
	elsif ($num == 1) {return 'C';}
	elsif ($num == 2) {return 'G';}
	elsif ($num == 3) {return 'T';}
}