//: Playground - noun: a place where people can play

import UIKit

// Given a number N >= 0, find its representation in binary.
func findDigitsInBinary(_ A: inout Int) -> String {
  if A == 0 { return "0" } 
  var s = ""
  while A != 1 {
    s += A % 2 == 1 ? "1" : "0"
    A /= 2
  }
  s += A % 2 == 0 ? "0" : "1"
  return String(s.reversed())
}

// Given 2 non negative integers m and n, find gcd(m, n)
// GCD of 2 integers m and n is defined as the greatest integer g such that g is a divisor of both m and n.
// Both m and n fit in a 32 bit signed integer.
func gcd(_ A: inout Int, _ B: inout Int) -> Int {
  if A == 1 || B == 1 { return 1 }
  if A == 0 { return B }
  if B == 0 { return A }
  var gcd = 0
  guard A > 0, B > 0 else { return gcd }
  
  var smallerNumber: Int
  var largerNumber: Int
  if A < B {
    smallerNumber = A
    largerNumber = B
  } else {
    smallerNumber = B
    largerNumber = A
  }
  
  for i in stride(from: smallerNumber, to: 0, by: -1) {
    if smallerNumber % i == 0, largerNumber % i == 0 {
      // i is a factor for both
      gcd = i
      break
    }
  }
  
  return gcd
}

// Palindrome
func isPalindrome(value: String) -> Bool {
  var itIsPalindrome = false
  
  for index in 0...value.count/2 {
    let beginIndex = value.index(value.startIndex, offsetBy: index)
    let beginChar = value[beginIndex]
    
    let endIndex = value.index(value.index(before: value.endIndex), offsetBy: 0 - index)
    let endChar = value[endIndex]
    
    if beginChar == endChar {
      itIsPalindrome = true
    } else {
      break
    }
    
    // if string is odd, do not check midpoint character
    if value.count % 2 != 0 && index == value.count / 2 - 1 {
      itIsPalindrome = true
      break
    }
  }
  
  return itIsPalindrome
}

func isPalindromeReverse(value: String) -> Bool {
  if value == String(value.reversed()) {
    return true
  } else {
    return false
  }
}

//Given an unsorted integer array, find the first missing positive integer.
func firstMissingPositive(_ A: [Int]) -> Int {
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
firstMissingPositive([1])

// Given a sorted array of integers, find the number of occurrences of a given target value.
func findCount(_ A: [Int], _ B: Int) -> Int {
  return A.filter { $0 == B }.count
}
findCount([5, 7, 7, 8, 8, 10], 8)

// Given a N cross M matrix in which each row is sorted, find the overall median of the matrix. Assume N*M is odd.
func findMedian(_ A: [[Int]]) -> Int {
  var combinedArray = [Int]()
  for array in A {
    combinedArray.append(contentsOf: array)
  }
  let medianIndex = Int(floor(Double(combinedArray.count/2)))
  return combinedArray.sorted()[medianIndex]
}
findMedian([[1, 3, 5], [2, 6, 9], [3, 6, 9]])
