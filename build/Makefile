LIBNAME=qdrgdk
SDCCBIN=
QDRDK_HOME=..
include target.mk
LIB=$(QDRDK_HOME)/lib/$(TARGETLIB)
CPPFLAGS=
CFLAGS=-m$(TARGETM)
ARFLAGS=-rvcD
ASFLAGS=
LDFLAGS=-L$(LIB)/ -l$(LIBNAME)

VPATH = $(QDRDK_HOME)/src:$(QDRDK_HOME)/src/$(TARGETLIB):$(QDRDK_HOME)/pix:$(QDRDK_HOME)/include

.PHONY: build
build: $(LIB)/$(LIBNAME).lib $(LIB)/crt0.rel

# we just named them %.o so we can use them with implicit rules
%.rel: %.o
	cp $^ $@

$(LIB)/%.rel: %.o | $(LIB)/
	cp $^ $@

$(LIB)/$(LIBNAME).lib: $(LIBNAME).rel | $(LIB)/
	$(AR) $(ARFLAGS) $@ $^

%/:
	mkdir -p $*/

.PHONY: clean
clean:
	-$(RM) *.asm *.gb *.gbc *.ihx *.lk *.lst *.map *.noi *.o *.sym *.rel
	-$(RM) $(LIB)/$(LIBNAME).lib $(LIB)/crt0.rel