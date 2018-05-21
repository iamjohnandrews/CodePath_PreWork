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
