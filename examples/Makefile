.PHONY: all clean phony_explicit

all: */

clean:
	for f in */; do $(MAKE) -C "$$f" clean; done 

phony_explicit:

%/: phony_explicit
	$(MAKE) -C $@
