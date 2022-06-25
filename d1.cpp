#include <iostream>

int main() {
    int c;
    std::cin >> c;
    int b = 1;
    int a = 0;

    while (c--) {
        a = a ^ b;
        b = b ^ a;
        a = a ^ b;
        b += a;
    }

    std::cout << a << "\n";
    return 0;
}