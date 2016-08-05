#! /usr/bin/perl

# Munge libserialport.h.in to produce libserialport.h
# Assumes that macro values are defined on the command line
# in the form
#     MACRO=value

my %macros = ();
while (scalar(@ARGV) > 0) {
	my $arg = shift @ARGV;
	my @a = split(/=/, $arg);
	if (scalar(@a) == 2) { $macros{$a[0]} = $a[1]; }
}

while (<>) {
	if (/^#undef (\w+)/ && (exists $macros{$1})) {
		$_ = "#define $1 $macros{$1}\n";
	}
	print;
}
