#include<iostream>
using namespace std;

struct complex {
    int re;
    int im;
};

int islessthan (complex e1, complex e2) {
    if(e1.re < e2.re) return 1;
    if(e1.re == e2.re && e1.im < e2.im) return 1;
    else return 0;
}

int numlessthan(complex elt, complex* A, int start, int end) {
    int count = 0;
    for(int i = start; i < end; i++) {
        if(islessthan(A[i], elt)) count++;
    }
    return count;
}

int main() {
    complex A[4] = {{0,0}, {-1,2}, {0,2}, {-1,-1}};
    int a, b;
    cin >> a >> b;
    complex elt = {a, b};
    int count = numlessthan(elt, A, 0, 4);
    cout << count << endl;
}