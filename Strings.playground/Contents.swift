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
