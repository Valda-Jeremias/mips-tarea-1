// factorial.c
// calcula el factorial de un numero ingresado por el usuario
#include <stdio.h>

int main() {
  int n = 0;
  printf("Ingrese un numero: ");
  scanf("%d", &n);
  int res = 1;
  while (n > 0) {
    res *= n;
    n--;
  }
  printf("%d\n", res);
  return 0;
}
