#include <iostream>

int main() {
    unsigned int b =  0xffffffff;
    while (true) {
        unsigned int a;

        std::cin >> a;
        if (a == 0) {
            break;
        } else if (a > b) {
            continue;
        } else {
            b = a;
            continue;
        }
    }
    std::cout << b;

    return 0;
}