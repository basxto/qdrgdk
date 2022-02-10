#include <stdio.h>
#include <string.h>

int putchar (int c) {
  return c;
}

void hello (char c) {
  printf("Hello %s%c\n", "world", c);
}

void main () {
  hello('!');
  hello('?');
}