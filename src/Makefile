# *********************************************************************** #
# This is a makefile for the Cleasby & Vigfusson non-eng dictionary, to   #
# automatize conversion from original text format to different structured #
# ones, like xml and html.                                                #
# *********************************************************************** #
# Version: $Id$

xml: cl_vf.xml
cl_vf.xml: oi_cleasbyvigfusson.txt \
		   convert2xml.pl \
		   add-entry-markup.pl
	./convert2xml.pl $< | ./add-entry-markup.pl > $@

html: cl_vf.html
cl_vf.html: cl_vf.xml xml2html.xsl
	xsltproc xml2html.xsl $< > $@

clean:
	rm -f *.xml *.html
