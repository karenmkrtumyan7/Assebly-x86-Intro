#include <iostream>

int main() {
  int mask[5] = { 0xffff, 0xff00ff, 0xf0f0f0f, 
    0x33333333,   0x55555555 
  };
  unsigned int a;
  std::cin >> a;
  int *b = mask;
  b += 4;
  int c = 1;

  do {
    unsigned int si = *b;
    unsigned int di = si;
    di = ~di;
    unsigned int d = a;
    a = a & si;
    d = d & di;
    
    unsigned int cl = c & 0b011111111;
    a = a << cl;
    d = d >> cl;
    
    a = a | d;
    c = c << 1;
    b -= 1;
    
  } while ((b + 1) != (mask));

  std::cout << a << "\n";
}