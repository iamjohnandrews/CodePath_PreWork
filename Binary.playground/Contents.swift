//: Playground - noun: a place where people can play

import UIKit

// BINARY ANSWERS ARE IN C
/*
 Implement pow(x, n) % d.
 
 In other words, given x, n and d,
 
 find (xn % d)
 
 Note that remainders on division cannot be negative. 
 In other words, make sure the answer you return is non negative.
 
 Input : x = 2, n = 3, d = 3
 Output : 2
 
 2^3 % 3 = 8 % 3 = 2.
 */
int powmod(int x, int n, int d) {
  int temp;
  long long a = x%d;
  long long res=1;
  if(x==0)
  return 0;
  if (n == 0) return 1 % d;
  while(n>0)
  {
    if (n % 2 == 1) {
      res = (res * a) % d;
      n--;
    } else {
      a = (a * a) % d;
      n = n>>1;
    }
  }
  
  if(res < 0)
  {
    res = (res + d) % d;
  }
  
  return (int)res;
}

/*
There are two sorted arrays A and B of size m and n respectively.

Find the median of the two sorted arrays ( The median of the array formed by merging both the arrays ).

The overall run time complexity should be O(log (m+n)).

Sample Input

A : [1 4 5]
B : [2 3]

Sample Output

3
*/
int min(int a,int b){
  if(a<b)
  return a;
  return b;
}

double fms(const int *A, int m,const int *B, int n, int k){
  
  if (m>n) {return fms(B,n,A,m,k);}
  
  if (m==0) { return B[k-1];}
  if (k==1) { return min(A[0],B[0]);}
  int pa = min(k/2,m);
  int pb = k-pa;
  if (A[pa-1]<=B[pb-1]) {return fms(A+pa,m-pa,B,n,k-pa);}
  return fms(A,m,B+pb,n-pb,k-pb);
}
double findMedianSortedArrays(const int* A, int n1, const int* B, int n2) {
  int total = n1+n2;
  if(total%2==1)
  return fms(A,n1,B,n2,total/2+1);
  else
  return ((fms(A,n1,B,n2,total/2)+fms(A,n1,B,n2,total/2+1))/2);
}

/* C++
 Given a N cross M matrix in which each row is sorted, find the overall median of the matrix. Assume N*M is odd.
 
 For example,
 
 Matrix=
 [1, 3, 5]
 [2, 6, 9]
 [3, 6, 9]
 
 A = [1, 2, 3, 3, 5, 6, 6, 9, 9]
 
 Median is 5. So, we return 5.
 */
int Solution::findMedian(vector<vector<int> > &A) {
  int l = 0, r = INT_MAX;
  int mid, req = (int)A.size() * (int)A[0].size();
  assert(req % 2);
  while(r - l > 1){
    mid = l + (r - l) / 2;
    int cnt = 0;
    for(auto &i: A){ 
      //using upper bound in a sorted array to count number of elements smaller than mid
      int p = upper_bound(i.begin(), i.end(), mid) - i.begin();
      cnt += p;
    }
    if(cnt >= (req/2 +1)) r = mid;
    else l = mid;
  }   
  return r;
}
