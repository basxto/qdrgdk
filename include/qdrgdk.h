#ifndef LIB_QDRDK_H
#define LIB_QDRDK_H
#include <string.h>

// special functions which are vram safe

extern void *vram_memcpy (void * dest, const void * src, size_t n);

#endif