#!/usr/bin/perl -w

use utf8;

print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
print "<?xml-stylesheet type=\"text/xsl\" href=\"./xml2html.xsl\"?>\n";
print "<dictionary>\n";

while (<>) {

#Incomplete entity declarations (missing ;):
s/&FINGER</\x{261a}</g ;
s/>or&eth</>or\x{00f0}</g ;

# Some tag cleanup:
# empty elements need to be properly closed:
s/<PAGE NUM=\"(.+)\">/<PAGE NUM="$1"\/>/g ;

# XML tags are case sensitive:
s/<i>/<I>/g ;
s/<\/i>/<\/I>/g ;
s/<b>/<B>/g ;
s/<\/b>/<\/B>/g ;

#Incomplete markup (missing end tags):
s/(<B>Þórs-ness-lönd,)/$1<\/B>/ ;
s/(<I>to freight a)/$1<\/I>/ ;
s/(n. <I>glottis.)/$1<\/I>/ ;
s/(<I>vigorous,) $/$1<\/I>/ ;
s/(<I>"bis,,) to $/$1<\/I> to/ ;
s/(<I>to draw) $/$1<\/I>/ ;
s/(<I>fatherly) (<PAGE)/$1<\/I>\n\n$2/ ;
s/(<I>into after death,)/$1<\/I>/ ;
s/(<I>rasta = GREEK,<)(I>)/$1\/$2/ ;
s/(<I>unpromising for peace,)/$1<\/I>/ ;
s/(fool, lubber.)/$1<\/I>/ ;
s/(<I>a shrill sound.)/$1<\/I>/ ;
s/(to be held in small repute.)/$1<\/I>/ ;
s/(and needles.\))/$1<\/I>/ ;
s/(<I>the hoof\.)/$1<\/I>/ ;
s/<\/I> (<B>&aacute;nalegr,<\/B> adj. )/$1/ ;
s/(<B>r&aacute;&eth;a-hagr,)<B>/$1<\/B>/ ;
s/(<B>&THORN;&oacute;rs-ness-l&ouml;nd, -&thorn;ing,)/$1<\/B>/ ;

# Comma should *follow* the B tag:
s/,<\/B>/<\/B>,/g ;

# Insert a wrapper for the entries after the intro:
s/(<\/INTRODUCTION>)/$1\n\n<entries>/ ;

# Insert an opening <e> element at the first entry:
s/(A\. is the first letter)/<e>$1/ ;

# Remove stranded end tags:
s/^<\/I>$//;
s/<\/I> (<B>ánalegr<\/B>)/$1/ ;

print ;
}

print "\n</e>\n";
print "\n</entries>\n";
print "</dictionary>\n";
