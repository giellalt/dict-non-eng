# *********************************************************************** #
# This is a makefile for the Cleasby & Vigfusson non-eng dictionary, to   #
# automatize conversion from original text format to different structured #
# ones, like xml and html.                                                #
# *********************************************************************** #
# Version: $Id$

xml: cl_vf.xml
cl_vf.xml: oi_cleasbyvigfusson.txt \
		   convert2xml.pl \
		   entity-convert.pl \
		   add-entry-markup.pl
	./convert2xml.pl $< | ./entity-convert.pl | ./add-entry-markup.pl > $@
	xmllint --noout $@

html: cl_vf.html
cl_vf.html: cl_vf.xml xml2html.xsl
	xsltproc xml2html.xsl $< > $@

entity-convert.pl: character_database.txt convert-entity-file.pl
	./convert-entity-file.pl $< > $@
	chmod a+x $@

update: oi_cleasbyvigfusson.txt character_database.txt

character_database.txt:
	curl -o character_database.txt \
			http://lexicon.ff.cuni.cz/misc/character_database.txt

oi_cleasbyvigfusson.txt:
	curl -o oi_cleasbyvigfusson.txt \
			http://www.germanic-lexicon-project.org/txt/oi_cleasbyvigfusson.txt

clean:
	rm -f *.xml \
		  *.html

really-clean: clean
	rm -f oi_cleasbyvigfusson.txt \
		  entity-convert.pl \
		  character_database.txt
