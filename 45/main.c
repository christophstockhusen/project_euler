#include <stdio.h>

long unsigned int tri(long unsigned int n)
{
  return n*(n+1)/2;
}

long unsigned int pent(long unsigned int n)
{
  return n*(3*n-1)/2;
}

long unsigned int hex(long unsigned int n) 
{
  return n*(2*n-1);
}

int main ()
{
  long unsigned int t, p, h;
  t = 285;
  p = 165;
  h = 143;
  
  int flag = 1;

  int c = 0;

  while (1)
    {
      t++;
      while (pent(p) < tri(t))
        p++;
      while (hex(h) < tri(t)) 
        h++;
      if (tri(t) == hex(h) && tri(t) == pent(p))
        break;
    }

  printf("%lu\n", tri(t));
  return 0;
}
