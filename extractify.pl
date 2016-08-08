#! /usr/bin/perl

# Extract a configuration macro value from configure.ac.

my $name = shift @ARGV;
my $lcname = lc $name;
while (<>) {
	if (/m4_define\s*\(\s*\[\s*$lcname\s*\]\s*,\s*\[\s*(\d+)\s*\]/) {
		print "$1\n";
		exit 0;
	} elsif (/$name=(\d+)/) {
		print "$1\n";
		exit 0;
	}
}

print "-1\n";
exit 1;
