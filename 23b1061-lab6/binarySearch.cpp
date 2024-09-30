#include<iostream>
using namespace std;

int binarySearch(int *A, int len, int start, int end, int val) {
    if(start > end) return -1;
    int mid = (start + end) / 2;
    if(A[mid] == val) return mid;
    if(A[mid] > val) return binarySearch(A, len, start, mid - 1, val);
    else return binarySearch(A, len, mid + 1, end, val);
}
int main() {
    int A[] = {0, 1, 2, 3, 4, 5, 6, 7};
    int len = 8;
    int val;
    cin >> val;
    cout << binarySearch(A, len, 0, 7, val) << endl;
}