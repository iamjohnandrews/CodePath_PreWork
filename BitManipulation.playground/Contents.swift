//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array of N integers, find the pair of integers in the array which have minimum XOR value. Report the minimum XOR value.
 
 Examples : 
 Input 
 0 2 5 7 
 Output 
 2 (0 XOR 2) 
 Input 
 0 4 7 9 
 Output 
 3 (4 XOR 7)
 
 Constraints: 
 2 <= N <= 100 000 
 0 <= A[i] <= 1 000 000 000
 */
func findMinXor(_ A: inout [Int]) -> Int {
  
  A.sort()
  
  var min = -1
  for i in 0 ..< A.count {
    for j in i + 1 ..< A.count {
      let value = A[i] ^ A[j]
      if value < min  || min == -1 {
        min = value
      } else if value >= min * 2 {
        break
      }
      if min == 0 {
        return min
      }
    }
  }
  return min
}

/*
 Write a function that takes an unsigned integer and returns the number of 1 bits it has.
 
 Example:
 
 The 32-bit integer 11 has binary representation
 
 00000000000000000000000000001011
 so the function should return 3.
 
 Note that since Java does not have unsigned int, use long for Java
 */
int numSetBits(unsigned int n) {
  int ct=0;
  while(n!=0){
    if(n & 1)
    ct++;
    n = (n >> 1);
  }
  return ct;
}

/*
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example :
 
 Input : [1 2 2 3 1]
 Output : 3
 */
int singleNumber(const int* A, int n1) {
  int i,ans=A[0];
  for(i=1;i<n1;i++)
  ans=ans^A[i];
  return ans;
}
