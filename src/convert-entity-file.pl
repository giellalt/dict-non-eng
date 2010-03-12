#!/usr/bin/perl

use utf8;

print "#!/usr/bin/perl -w

use utf8;

while (<>) {
# The following entity list is hand-made because of
# lack of direct unicode mapping:
s/&dash-uncertain;/\x{223C}/g ;
s/&e-sub;/\x{2091}/g ;
s/&a-super;/<sup>a<\\/sup>/g ;
s/&e-super;/<sup>e<\\/sup>/g ;
s/&m-super;/<sup>m<\\/sup>/g ;
s/&o-super;/<sup>o<\\/sup>/g ;
s/&t-super;/<sup>t<\\/sup>/g ;
s/&u-super;/<sup>u<\\/sup>/g ;
s/&aolig;/a\x{fe20}\x{fe21}o/g ;
s/&aolig-acute;/a\x{fe20}\x{fe21}o\x{0301}/g ;
s/&oalig-acute;/o\x{fe20}\x{fe21}a\x{0301}/g ;
s/&thorn-bar;/\x{00fe}\x{0336}/g ;
s/&THORN-bar;/\x{00de}\x{0336}/g ;

# The following entities are NOT defined in the source file:
s/&c-reversed-long;/\x{2184}\x{0304}/g ;
s/&c-super;/<sup>c<\\/sup>/g ;
s/&hand;/\x{261d}/g ;

s/&frac12;/\x{00bd}/g ;
s/&g-long;/\x{1e21}/g ;
s/&h-bar;/\x{0127}/g ;
s/&ordm;/<sup>m<\\/sup>/g ;
s/&rArr;/\x{2192}/g ;
s/&times;/\x{00d7}/g ;

s/&FINGER;/\x{261a}/g ;
s/&OMEGA;/\x{03a9}/g ;
s/&avlig;/a\x{fe20}\x{fe21}v/g ;
s/&av-ligature;/a\x{fe20}\x{fe21}v/g ;
s/&infin;/\x{29dc}/g ;

# Here starts the list of the generated mapping table:
" ;

while (<>) {
    chomp;
    next if /^\s*$/; # skip empty lines
    next if /^#/; # skip comment lines

    # split input into fields:
    my
    (
     $unicode,
     $entity,
     $character,
     $class,
     $ishtml,
     $isvalidentity,
     $basechar,
     $typingsequence,
     $tex
     )
	= split /\t/;

    # skip xml entities:
    next if $unicode =~ /^U0022$/;
    next if $unicode =~ /^U0026$/;
    next if $unicode =~ /^U003C$/;
    next if $unicode =~ /^U003E$/;
    # skip empty unicode cases:
    next if $unicode =~ /^\-$/;

    $unicode =~ s/U//g ;

    my @unicodes = split /\+/, $unicode;
    my $newcode = "";
    for my $code (@unicodes) {
        $char = chr(hex($code)) ;
        $newcode = $newcode . $char;
    }
    
    print "s/$entity/$newcode/g ;\n";
}

print "print ;
}
" ;
