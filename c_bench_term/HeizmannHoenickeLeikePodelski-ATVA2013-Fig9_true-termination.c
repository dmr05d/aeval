extern int __VERIFIER_nondet_int(void);

int main() {
  int x, y, z;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  z = __VERIFIER_nondet_int();
  if (2*y >= z) {
    while (x >= 0 && z == 1) {
      x = x - 2*y + 1;
    }
  }
	return 0;
}
