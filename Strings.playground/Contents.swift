//: Playground - noun: a place where people can play

import UIKit

// Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
// If the last word does not exist, return 0.
func lengthOfLastWord(_ A: String) -> Int {
  let trimmedString = A.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  guard trimmedString.rangeOfCharacter(from: CharacterSet.whitespaces) != nil else { return trimmedString.count }
  var lastWordLength = 0
  
  for char in trimmedString.reversed() {
    if String(char).rangeOfCharacter(from: CharacterSet.whitespaces) != nil {
      lastWordLength = trimmedString.reversed().index(of: char)!
    }
  }
  
  return lastWordLength
}

/*
 The count-and-say sequence is the sequence of integers beginning as follows:
 
 1, 11, 21, 1211, 111221, ...
 1 is read off as one 1 or 11.
 11 is read off as two 1s or 21.
 
 21 is read off as one 2, then one 1 or 1211.
 
 func countAndSay(_ A: Int) -> String {
 var countAndSayArray = ["1", "11"]
 if A < 3 {
 return countAndSayArray[A]
 }
 
 while countAndSayArray.count != A {
 let lastValue = countAndSayArray.last!
 var counter = 0
 var newElement = ""
 for i in 1..<lastValue.count {
 let currentIndex = lastValue.index(lastValue.startIndex, offsetBy: i)
 let currentChar = String(lastValue[currentIndex])
 
 let previousIndex = lastValue.index(lastValue.startIndex, offsetBy: i - 1)
 let previousChar = String(lastValue[previousIndex])
 print("currentIndex: \(currentIndex) | currentChar: \(currentChar) | previousIndex: \(previousIndex) | previousChar: \(previousChar)")
 
 if currentChar == previousChar {
 counter = counter + 1
 } else {
 newElement = newElement + String(counter) + currentChar
 print(" WTF: \(String(counter) + currentChar)")
 counter = 0
 }
 }
 countAndSayArray.append(newElement)
 }
 return countAndSayArray.last!
 }
 countAndSay(4)
 */

/*
 You are given a string. The only operation allowed is to insert characters in the beginning of the string. How many minimum characters are needed to be inserted to make the string a palindrome string
 
 Example:
 Input: ABC
 Output: 2
 Input: AACECAAAA
 Output: 2
 */
class Solution {
  func solve(_ A: inout String) -> Int {
    var result = numAppends(&A)
    return result
    
  }
  
  func numAppends(_ A: inout String) -> Int {
    
    var strLen = A.count
    var result = 0
    if(strLen==1 || strLen==0) {
      return 0 
    }
    
    for i in stride(from:strLen-1, through:0,by:-1) {
      result = strLen-1-i
      if(isPalindrome(&A,0,i)) {
        return result
      }
    }
    
    return result
  }
  
  func isPalindrome(_ A: inout String,_ start: Int, _ end: Int) -> Bool {
    var inpStr = Array(A.characters)
    var start1 = start, end1 = end
    while start1 < end1 {
      if inpStr[start1] != inpStr[end1] {
        return false
      }
      start1+=1
      end1-=1
    }
    return true
  }
}

/*
 Another question which belongs to the category of questions which are intentionally stated vaguely. 
 Expectation is that you will ask for correct clarification or you will state your assumptions before you start coding.
 
 Implement strStr().
 strstr - locate a substring ( needle ) in a string ( haystack ). 
 */
class Solution {
  func strStr(_ A: String, _ B: String) -> Int {
    var answer = -1
    
    var haystack = Array(A)
    var needle = Array(B)
    
    var i = 0
    while i < haystack.count {
      var hold = i
      var j = 0
      while j < needle.count && i < haystack.count && haystack[i] == needle[j] {
        if needle[j] == haystack[i] {
          if j == (needle.count - 1){
            return i - j
          }
          i += 1
          j += 1
        } else {
          break
        }
      }
      
      i = hold + 1
    }
    
    return answer
  }
}

/*
 Implement atoi to convert a string to an integer.
 
 Example :
 
 Input : "9 2704"
 Output : 9
 Note: There might be multiple corner cases here. Clarify all your doubts using “See Expected Output”.
 
 Questions: Q1. Does string contain whitespace characters before the number?
 A. Yes Q2. Can the string have garbage characters after the number?
 A. Yes. Ignore it. Q3. If no numeric character is found before encountering garbage characters, what should I do?
 A. Return 0. Q4. What if the integer overflows?
 A. Return INT_MAX if the number is positive, INT_MIN otherwise. 
 */
func atoi(_ A: String) -> Int {
  var arr = (A.components(separatedBy: " ")).filter { $0.count != 0 }
  
  let first = Array(arr[0])
  
  let negative = first[0] == "-" ? true : false
  let positive = first[0] == "+" ? true : false
  var i = negative || positive ? 1 : 0
  var sum: Double = 0
  
  let len = arr[0].count
  while i < len {
    if let x = Int(String(first[i])) {
      sum = (sum * 10) + Double(x)
    }
    else {
      break
    }
    i += 1
    
  }
  if sum > Double(Int32.max) {
    return negative ? Int(Int32.min) : Int(Int32.max)
  }
  else {
    return negative ? -Int(sum) : Int(sum)
  }
}

/*
 Given an integer, convert it to a roman numeral, and return a string corresponding to its roman numeral version
 
 Input is guaranteed to be within the range from 1 to 3999.
 
 Example :
 
 Input : 5
 Return : "V"
 
 Input : 14
 Return : "XIV"
 */
func intToRoman(_ A: inout Int) -> String {
  if A == 0 { return "" }
  
  var romans = ["I", "X", "C", "M"]
  //             1    10  100  1000
  var romans5 = ["V", "L", "D"]
  //              5   50    500
  
  var numReversed:[Int] = []
  
  var strNum = String(A)
  for char in strNum {
    numReversed.append(Int(String(char))!)
  }
  
  numReversed = numReversed.reversed()
  
  
  var answer = ""
  
  for i in 0..<numReversed.count {
    var digit = numReversed[i]
    if digit == 0 {
      continue
    } else if digit < 4 {
      for j in 1...digit {
        answer = romans[i] + answer
      }
    } else if digit == 4 {
      answer = romans5[i] + answer
      answer = romans[i] + answer
    } else if digit == 5 {
      answer = romans5[i] + answer
    } else if digit < 9 {
      for j in 6...digit {
        answer = romans[i] + answer
      }
      answer = romans5[i] + answer
    } else if digit == 9 {
      answer = romans[i+1] + answer
      answer = romans[i] + answer
    }
  }
  
  return answer   
}

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 
 P.......A........H.......N
 ..A..P....L....S....I...I....G
 ....Y.........I........R
 And then read line by line: PAHNAPLSIIGYIR
 Write the code that will take a string and make this conversion given a number of rows:
 
 string convert(string text, int nRows);
 convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR"
 **Example 2 : **
 ABCD, 2 can be written as
 
 A....C
 ...B....D
 and hence the answer would be ACBD.
 */
func convert(_ A: inout String, _ B: inout Int) -> String {
  if B == 1 { return A }
  else if B == 0 { return "" }
  
  var strs = [String]()
  var arr = Array(A)
  var row = 0
  
  for i in 0..<B { 
    strs.append("")
  }
  var dir = 0 // down = 0; up = 1
  for i in 0..<A.count {
    strs[row] += String(arr[i])
    
    if row == (B - 1) {
      dir = 1
    }
    else if row == 0 {
      dir = 0
    }
    
    (dir == 0) ? (row += 1) : (row -= 1)
  }
  
  var ans = ""
  for i in 0..<B {
    ans += String(strs[i])
  }
  
  
  return ans
}
