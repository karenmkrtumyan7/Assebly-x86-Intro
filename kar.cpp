#include <iostream>
int n;
int k;
int a[21];
int b[21];
int main()
{
    std::cin >> n;
    std::cin >> k;
    int* esi = a;
    int* p2 = b;
    esi[0] = 1;
    int i = 0;
    while (i != n)
    {
        int j = 0;
        i++;
        p2[0] = 1;
        while (i != j)
        {
            ++j;
            p2[j] = esi[j] + esi[j - 1];
        }
        p2[j] = 1;
        std::swap(esi, p2);
    }
    std::cout << esi[k] << '\n';
    return 0;
}