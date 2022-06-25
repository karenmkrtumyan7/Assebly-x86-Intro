#include <iostream>

int main() {
    unsigned int c;
    std::cin >> c;
    int d = 0;
    int last_bit = c & 1;
    c = c >> 1;

  if (!last_bit) {
    do {
      int a;
      int b;
      std::cin >> a;
      std::cin >> b;
      a *= b;
      d += a;
      c--;
    } while(c);
  }

  std::cout << d << "\n";
  return 0;
}