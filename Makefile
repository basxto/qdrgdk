.PHONY: all clean phony_explicit
all:
ifndef TARGET
	$(MAKE) $@ TARGET=nes
	$(MAKE) $@ TARGET=gb
else
	$(MAKE) -C build/
	$(MAKE) -C examples/
endif

clean:
ifndef TARGET
	$(MAKE) $@ TARGET=nes
	$(MAKE) $@ TARGET=gb
else
	$(MAKE) -C build/ clean
	$(MAKE) -C examples/ clean
endif

phony_explicit:

build/%: phony_explicit
ifndef TARGET
	$(MAKE) $@ TARGET=nes
	$(MAKE) $@ TARGET=gb
else
	$(MAKE) -C build/ $*
endif

lib/%: phony_explicit
ifndef TARGET
	$(MAKE) $@ TARGET=nes
	$(MAKE) $@ TARGET=gb
else
	$(MAKE) -C build/ ../$@
endif

examples/%: phony_explicit
ifndef TARGET
	$(MAKE) $@ TARGET=nes
	$(MAKE) $@ TARGET=gb
else
	$(MAKE) -C examples/ $*
endif
