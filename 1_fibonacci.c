// fibonacci.c
// imprime los primeros 20 numeros de Fibonacci
#include <stdio.h>

int main() {
  int a = 0;
  int b = 1;
  int c = 0;
  printf("%d\n", a);
  printf("%d\n", b);
  for (int i = 18; i > 0; i--) {
    c = a + b;
    printf("%d\n", c);
    a = b;
    b = c;
  }
  return 0;
}
