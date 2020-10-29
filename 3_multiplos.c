// multiplos.c
// imprime los multiplos de 3 o de 5 (o de ambos)
// para los primeros 100 numeros naturales
#include <stdio.h>

int main() {
  for (int i = 1; i <= 100; i++) {
    if (i % 3 == 0)
      printf("%d\n", i);
    else if (i % 5 == 0)
      printf("%d\n", i);
  }
  return 0;
}
