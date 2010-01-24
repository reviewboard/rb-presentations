INKSLIDE = $(PWD)/scripts/inkslide.py

TARGETS = \
	linkedin2010 \
	foo

TARGET_LISTS = $(addsuffix .list,$(TARGETS))

all:
	@echo "Slide targets:"
	@echo
	@for target in $(TARGETS); do \
		echo "    $$target"; \
	done

$(TARGETS): %: %.list

$(TARGET_LISTS): %.list: slides/%/slides.rst
	   @slides_dir="$(dir $<)" \
	&& cd "$$slides_dir" \
	&& "$(INKSLIDE)" template.svg slides.rst \
	&& cd "$(PWD)" \
	&& ls -1 "$$slides_dir"/slide*.svg > $@
