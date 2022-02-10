ROM=infiniteloop
SDCCBIN=
QDRDK_HOME=../..
include $(QDRDK_HOME)/build/target.mk
LIB=$(QDRDK_HOME)/lib/$(TARGETLIB)
CPPFLAGS= -I$(LIB)/include/ -I$(LIB)/../include/
CFLAGS=-m$(TARGETM) --verbose #--fverbose-asm
ARFLAGS=
ASFLAGS=
LDFLAGS=-L$(LIB)/ -lqdrgdk

OBJ=build/$(TARGETLIB)/main.rel

.PHONY: build clean
build: bin/$(TARGETLIB)/$(ROM).$(TARGETEXT)

build/$(TARGETLIB)/%.rel: %.c
	mkdir -p $$(dirname $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(TARGETCFLAGS) -c -o $@ $^

build/$(TARGETLIB)/$(ROM).ihx: $(LIB)/crt0.rel $(OBJ) | $(LIB)/qdrgdk.lib
	$(CC) $(CPPFLAGS) $(LDFLAGS) $(CFLAGS) $(TARGETCFLAGS) --out-fmt-ihx -o $@ $^


bin/$(TARGETLIB)/%.gb: build/$(TARGETLIB)/%.ihx
	mkdir -p $$(dirname $@)
	$(MKBIN) -Z -yn "$*" -yS $< $@
	cp build/$(TARGETLIB)/$*.sym build/$(TARGETLIB)/$*.noi bin/$(TARGETLIB)/

bin/$(TARGETLIB)/%.gg: build/$(TARGETLIB)/%.ihx
	mkdir -p $$(dirname $@)
	$(MKBIN) -S $< $@

bin/$(TARGETLIB)/%.sms: build/$(TARGETLIB)/%.ihx
	mkdir -p $$(dirname $@)
	$(MKBIN) -S $< $@

# needs makebin support
# https://wiki.nesdev.org/w/index.php?title=NES_2.0
# 32KiB, size decided by crt0
build/$(TARGETLIB)/%.part.nes: build/$(TARGETLIB)/%.ihx
	$(MKBIN) -o 0x8000 -s $$((0x8000 + 2*(16*1024) + 0*(8*1024))) $< $@

# NROM-256 (32KiB)
bin/$(TARGETLIB)/%.nes: build/$(TARGETLIB)/%.part.nes
	mkdir -p $$(dirname $@)
	printf "NES\x1A\x02\x00\x00\x08\x00\x00\x00\x00\x01\x00\x00\x00" > $@
	cat $< >> $@


# just make sure to build it if it was never built
# this is not intended for updating the build
$(LIB)/qdrgdk.lib:
	$(MAKE) -C $(QDRDK_HOME)/build/ ../lib/$(TARGETLIB)/qdrgdk.lib

$(LIB)/crt0.rel:
	$(MAKE) -C $(QDRDK_HOME)/build/ ../lib/$(TARGETLIB)/crt0.rel

clean: 
	$(RM) *.asm *.ihx *.lk *.lst *.map *.noi *.rel *.sym
	$(RM) -r build/$(TARGETLIB) bin/$(TARGETLIB)