    .module crt0
    .globl  _main
    .area   _HEADER (ABS)

    .org    0x100
__qdrgdk_gb_header:
    jr      __qdrgdk_gb_init

    .org    0x150
__qdrgdk_gb_init:
    di                  ;disable interrupts
    ld      sp, #0xe000 ;init stack
    ; jump to main() and loop infinitely on return
    call    _main
99$:
    halt
    nop
    jr      99$

    ;; Ordering of segments for the linker.
    .area   _HOME
    .area   _CODE
    .area   _INITIALIZER
    .area   _GSINIT
    .area   _GSFINAL

    .area   _DATA
    .area   _INITIALIZED
    .area   _BSEG
    .area   _BSS
    .area   _HEAP

    .area   _CODE