#include <iostream>
//#include <limits>

static unsigned int a;
unsigned int F();

unsigned int REC() {
  --a;
  F();
  unsigned int* b = &a;
  a =  3 * a;
  return a;
}

unsigned int F() {
  if (a == 0) {
    a = 1;
    return a;
  }
  REC();
  return a;
}


int main() {
  std::cin >> a;
  F();
  std::cout << a << "\n";
}