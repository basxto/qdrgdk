    .module crt0
    .globl _main

    ;; Ordering of segments for the linker.
    .area HOME    (CODE)
    .area GSINIT  (CODE)
    .area GSFINAL (CODE)
    .area CSEG    (CODE)
    .area XINIT   (CODE)
    .area CONST   (CODE)
    .area DSEG    (PAG)
    .area OSEG    (PAG, OVR)
    .area XSEG
    .area XISEG


    .area   CODEIVT (ABS)
    .org    0xfffa
    .dw     __qdrgdk_nes_init ;NMI vector
    .dw     __qdrgdk_nes_init ;reset vector
    .dw	    __qdrgdk_nes_init ;IRQ/BRK vector

    .area   GSINIT
__qdrgdk_nes_init:
    sei             ;disable interrupts
    cld             ;disable bcd
    ldx     #0x0
    ;TODO: use labels
    stx     0x2000  ;disable NMI
    stx     0x2001  ;disable rendering
    stx     0x4010  ;disable DMC IRQ
    dex             ;X = 0xff
    txs             ;init stack
    ; jump to main() and loop infinitely on return
    jsr     _main
    jmp     .