#include <stdio.h>

int main()
{
  int x, y;
  (x, y) = (2, 3);
  // x = y = z = w = t;
  printf("%d,%d\n", x, y);
  return 0;
}