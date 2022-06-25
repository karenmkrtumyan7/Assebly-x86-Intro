#include <iostream>

static int a;
static int b;

int f1() {
  return a * b;
}

int f2() {
  return a + b;
}

int f3() {
  return a - b;
}

int f4() {
  return a / b;
}


int main() {
  char c; 
  std::cin >> a >> c  >> b;
  c = c - 42;
  int p = c;
  // std::cout << p;

  switch (p) {
    case 0: 
      a = f1();
      break;
    case 1:
      a = f2();
      break;
    case 3:
      a = f3();
      break;
    case 5:
      a = f4();
      break;
  }
  std::cout << a << "\n";
}