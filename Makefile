#xml2rfc=$(HOME)/xml2rfc-1.36/xml2rfc.tcl
# Version 2
xml2rfc=xml2rfc

%.txt: %.xml
	export XML_LIBRARY=references; $(xml2rfc) $< $@

%.html: %.xml
	export XML_LIBRARY=reference; $(xml2rfc) --html $< $@


all: rtcweb-transports.txt

# Bring in all the RFC and I-D references
get-references: references
	rsync -avz --no-group rsync3.xml.resource.org::xml2rfc.bibxml/bibxml/ references
	rsync -avz --no-group rsync3.xml.resource.org::xml2rfc.bibxml/bibxml3/ references
	rsync -avz --no-group rsync3.xml.resource.org::xml2rfc.bibxml/bibxml4/ references

references:
	mkdir references

# Bring in all the RFC and I-D references from alt server
get-ref1: ref1
	rsync -avz --no-group rsync1.xml.resource.org::xml2rfc.bibxml/bibxml/ ref1
	rsync -avz --no-group rsync1.xml.resource.org::xml2rfc.bibxml/bibxml3/ ref1
	rsync -avz --no-group rsync1.xml.resource.org::xml2rfc.bibxml/bibxml4/ ref1

ref1:
	mkdir ref1
