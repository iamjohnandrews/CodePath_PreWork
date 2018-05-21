//: Playground - noun: a place where people can play

import UIKit

/*
 Find the intersection of two sorted arrays.
 OR in other words,
 Given 2 sorted arrays, find all the elements which occur in both the arrays.
 
 Example :
 
 Input : 
 A : [1 2 3 3 4 5 6]
 B : [3 3 5]
 
 Output : [3 3 5]
 
 Input : 
 A : [1 2 3 3 4 5 6]
 B : [3 5]
 
 Output : [3 5]
 */
func intersect(_ A: [Int], _ B: [Int]) -> [Int] {
  
  let aCount = A.count
  let bCount = B.count
  if aCount == 0 || bCount == 0 {
    return []
  }
  
  var result = [Int]()
  var aIndex = 0, bIndex = 0
  while aIndex < aCount && bIndex < bCount {
    while aIndex < aCount && bIndex < bCount && A[aIndex] == B[bIndex] {
      result.append(A[aIndex])
      aIndex += 1
      bIndex += 1
    }
    while aIndex < aCount && bIndex < bCount && A[aIndex] < B[bIndex]  {
      aIndex += 1
    }
    while aIndex < aCount && bIndex < bCount && A[aIndex] > B[bIndex] {
      bIndex += 1
    }
  }
  
  return result
}

/*
 Given two sorted integer arrays A and B, merge B into A as one sorted array.
 
 Note: You have to modify the array A to contain the merge of A and B. Do not output anything in your code.
 TIP: C users, please malloc the result into a new array and return the result. 
 If the number of elements initialized in A and B are m and n respectively, the resulting size of array A after your code is executed should be m + n
 
 Example :
 
 Input : 
 A : [1 5 8]
 B : [6 9]
 
 Modified A : [1 5 6 8 9]
 */
/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 * @input B : Integer array
 * @input n2 : Integer array's ( B ) length
 * 
 * @Return Returns a array of size n1 + n2 with A and B merged. 
 */
int* merge(int* A, int n1, int* B, int n2) {
  int *C= (int *) malloc(sizeof(int)*(n1+n2));
  
  int i=0, j=0;
  int k=0;
  
  while(i<n1 && j<n2)
  {
    if(A[i]<=B[j])
    {
      C[k]=A[i];
      i++;
      k++;
    }
    else
    {
      C[k]=B[j];
      j++;
      k++;
    }
  }
  
  while(i<n1)
  {
    C[k]=A[i];
    i++;
    k++;
  }
  
  while(j<n2)
  {
    C[k]=B[j];
    j++;
    k++;
  }
  
  return C;
}
/*
 Given three sorted arrays A, B and Cof not necessarily same sizes.
 
 Calculate the minimum absolute difference between the maximum and minimum number from the triplet a, b, c such that a, b, c belongs arrays A, B, C respectively.
 i.e. minimize | max(a,b,c) - min(a,b,c) |.
 
 Example :
 
 Input:
 
 A : [ 1, 4, 5, 8, 10 ]
 B : [ 6, 9, 15 ]
 C : [ 2, 3, 6, 6 ]
 Output:
 
 1
 */
func solve(_ A: inout [Int], _ B: inout [Int], _ C: inout [Int]) -> Int {
  
  var absoluteMin: Int = .max
  var aIndex = 0, bIndex = 0, cIndex = 0
  
  while aIndex < A.count, bIndex < B.count, cIndex < C.count {
    var minArray = [A[aIndex], B[bIndex], C[cIndex]]
    var min = minArray.min() ?? 0
    var max = minArray.max() ?? 0
    var diff = max - min
    if diff < absoluteMin {
      absoluteMin = diff
    }
    let indexOfArray = minArray.index(of: min) ?? 0
    if indexOfArray.distance(to: 0) == 0 {
      aIndex += 1
    }
    if indexOfArray.distance(to: 1) == 0 {
      bIndex += 1
    }
    if indexOfArray.distance(to: 2) == 0 {
      cIndex += 1
    }
  }
  
  return absoluteMin
}

/*
 You are given an array of N non-negative integers, A0, A1 ,…, AN-1.
 Considering each array element Ai as the edge length of some line segment, count the number of triangles which you can form using these array values.
 
 Notes:
 
 You can use any value only once while forming each triangle. Order of choosing the edge lengths doesn’t matter. Any triangle formed should have a positive area.
 
 Return answer modulo 109 + 7.
 
 For example,
 
 A = [1, 1, 1, 2, 2]
 
 Return: 4
 */
  func nTriang(_ A: inout [Int]) -> Int {
    if A.count < 3  {
      return 0
    }
    
    A.sort()
    
    var index0 = 0
    var index1 = 1
    
    var count = 0
    
    for i in 0 ..< A.count - 2 {
      
      var k = i + 2
      
      for j in i + 1 ..< A.count {
        
        while k < A.count && A[i] + A[j] > A[k] {
          k += 1
        }
        
        count += k - j - 1
      }
    }
    
    return count % 1000000007
  }

/*
 Remove duplicates from Sorted Array
 Given a sorted array, remove the duplicates in place such that each element appears only once and return the new length.
 
 Note that even though we want you to return the new length, make sure to change the original array as well in place
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 Example: 
 Given input array A = [1,1,2],
 Your function should return length = 2, and A is now [1,2]. 
 */
/**
 * @input A : Integer array
 * @input n1 : Integer array's ( A ) length
 * 
 * @Output Integer
 */
int removeDuplicates(int* A, int n1) {
  if(n1==0||n1==1) return n1;
  int i,j=0;
  int e=A[0];
  for(i=1;i<n1;i++){
    if(A[i]!=e){
      A[++j]=A[i];
      e=A[i];
    }
  }
  return ++j;
}

/*
 
 You are given with an array of 1s and 0s. And you are given with an integer M, which signifies number of flips allowed.
 Find the position of zeros which when flipped will produce maximum continuous series of 1s.
 
 For this problem, return the indices of maximum continuous series of 1s in order.
 
 Example:
 
 Input : 
 Array = {1 1 0 1 1 0 0 1 1 1 } 
 M = 1
 
 Output : 
 [0, 1, 2, 3, 4] 
 
 If there are multiple possible solutions, return the sequence which has the minimum start index.
 */
func maxone(_ A: inout [Int], _ B: inout Int) -> [Int] {
  
  if A.count == 0 || B < 0 {
    return []
  }
  
  // current window
  var start = 0
  var count = 0
  
  // result
  var globalStart = -1
  var globalLength = 0
  
  for i in 0..<A.count {
    
    if A[i] == 0 {
      count += 1
    }
    
    if count > B {
      for j in start...i {
        if A[j] == 0 {
          count -= 1
          start = j + 1
          break
        }
      }
    } else {
      // update results
      let currentLength = i - start + 1
      if currentLength  > globalLength {
        globalLength = currentLength
        globalStart = start
      }
    }
  }
  
  if globalStart != -1 {
    return Array(globalStart..<(globalStart + globalLength))
  }
  
  return []
}

