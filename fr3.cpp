#include <iostream>

int M(int a, int b, int c) {
  do {
    if (a < b) {
      a = a ^ b;
      b = b ^ a;
      a = a ^ b;
    } 

    if (a <= c) {
      return a;
    }
  
    a = a ^ c;
    c = c ^ a;
    a = a ^ c;
  } while (a < b);
  return a;
}

int main() {
  int a;
  int b; 
  int c;
  std::cin >> a >> b  >> c;
  std::cout << M(c, b, a) << "\n";
}