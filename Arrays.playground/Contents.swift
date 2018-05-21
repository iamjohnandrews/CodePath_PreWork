//: Playground - noun: a place where people can play

import UIKit

// Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
func maxSubArray(_ A: [Int]) -> Int {
  if A.count < 1 {
    return 0
  }
  
  var max = A[0]
  var currMax = A[0]
  
  for i in 1..<A.count {
    currMax += A[i]
    if currMax < A[i] {
      currMax = A[i]
    }
    if max < currMax {
      max = currMax
    }
  }
  return max
}

// generate the first numRows of Pascal’s triangle.
func generate(_ A: inout Int) -> [[Int]] {
  var results = [[Int]]()
  if (A == 0) {
    return results
  }
  for i in 0..<A {
    var currentResults = [Int]()
    for j in 0...i {
      if (i > 1 && j > 0 && j < i) {
        let value = results[i-1][j] + results[i-1][j-1]
        currentResults.append(value)
      } else {
        currentResults.append(1)
      }
    }
    results.append(currentResults)
  }
  return results
}

// Given an integer array, find if an integer p exists in the array such that the number of integers greater than p in the array equals to p
// If such an integer is found return 1 else return -1.
func solve(_ A: inout [Int]) -> Int {
  if A.count == 0 {
    return -1
  }
  
  var B = A
  B.sort { (a, b) -> Bool in
    return a >= b
  }
  
  for i in 0 ..< B.count {
    if i == 0 && B[0] == 0 {
      return 1
    }
    if B[i] == i && B[i - 1] > B[i] {
      return 1
    }
  }
  
  return -1
}

// Given a list of non negative integers, arrange them such that they form the largest number.
func largestNumber(_ A: [Int]) -> String {
  guard !A.isEmpty else { return "" }
  let removeDuplicatesSet = Set(A)
  guard removeDuplicatesSet.count > 1 else { return String(removeDuplicatesSet.first!) }
  let stringArray = A.map {String($0)}
  let tempArray = stringArray.sorted { x, y -> Bool in
    Int(x + y)! > Int(y + x)!
  }
  return tempArray.joined()
}

// Given an unsorted integer array, find the first missing positive integer.
func firstMissingPositive(_ A: inout [Int]) -> Int {
  guard let maxArrayValue = A.max(),
    maxArrayValue > 0 else { return 1 }
  if A.count == 1 {
    let element = A.first!
    return element < 0 ? 1 : element + 1
  }
  let sortedArray = A.sorted()
  for i in 1...sortedArray.count - 1 {
    let currentValue = sortedArray[i]
    let previousValue = sortedArray[i - 1]
    if currentValue > 1, previousValue < 0 { 
      return 1
    }
    guard currentValue > 0, previousValue > 0 else { continue }
    // assumes value should increase by one
    if currentValue - previousValue != 1 {
      return previousValue + 1
    } 
  }
  return sortedArray.last! + 1
}
