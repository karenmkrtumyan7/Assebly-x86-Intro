#include <iostream>

int main() {
    unsigned int a;
    std::cin >> a;
    unsigned int b = a;
  
    b--;
    a = a ^ b;
    a = a + 1; // add
    unsigned int cf = a <= (a - 1);
    cf = cf << 31;
    a = a >> 1;
    a = a | cf;

    std::cout << a << "\n";
}