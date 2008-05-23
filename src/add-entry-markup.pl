#!/usr/bin/perl -w

use utf8;

$/ = "\n\n";

while (<>) {
	chomp;
	# Entries usually starts with a bold-face, and extends
	# to the following empty line:
	if ( m/^<B/ ) {
		$_ = "</e><e>" . $_ ;
	}
	# Wrap URLs in <a> tags:
	if ( m/\s+(http\S+)/ ) {
		$_ = "<a href=\"$+\">" . $+ . "</a>" ;
	}
	# Plain text is wrapped in <p> elements:
#	if ( m/^\w\w/ ) {
#		$_ = "<p>" . $_ . "</p>" ;
#	}
	# TAb-indented plain text is wrapped in <quote> elements:
	if ( m/^\t\w/ ) {
		$_ = "<quote>" . $_ . "</quote>" ;
	}

	print ;
	print "\n\n" ;
}
