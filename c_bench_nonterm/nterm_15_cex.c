extern int __VERIFIER_nondet_int(void);

// non-termination for j = 3 and d = 2

int main()
{
  int j = __VERIFIER_nondet_int();
  int d = __VERIFIER_nondet_int();
  if (j <= d) return 0;
  if (d <= 1) return 0;
  
  while (j > d)
  {
    j = j%4;
  }
}
