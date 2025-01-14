SUBDIRS := spec/ics-003-connection-semantics spec/ics-004-channel-and-packet-semantics
TOPTARGETS := all clean

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

setup_dependencies:
	pip install matplotlib networkx

check: check_links check_dependencies check_syntax check_sections

check_links:
	python ./scripts/check_links.py

check_dependencies:
	python ./scripts/check_dependencies.py

check_syntax:
	bash ./scripts/check_syntax.sh

check_sections:
	python ./scripts/check_sections.py

.PHONY: $(TOPTARGETS) $(SUBDIRS) setup_dependencies check check_links check_dependencies check_syntax check_sections
