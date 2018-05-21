//: Playground - noun: a place where people can play

import UIKit

// Every even integer greater than 2 can be expressed as the sum of two primes
/* func findGoldbachsConjecture(for number: Int) -> [Int] {
  var allFactors = [1]
  guard number > 1 else { return allFactors }
  // find prime numbers up to number
  let sqroot = Int(sqrt(Double(number)))
  for i in 2...sqroot {
    if number % i == 0 {
      // i is a factor of number
      allFactors.append(i)
      
      if i != sqroot {
        // number/i is a factor of number
        allFactors.append(number/i)
      }
    }
  }
  
  var primeFactors = [Int]()
  //check if factors are prime
  for j in allFactors {
    let value = Int(sqrt(Double(allFactors[j])))
    if value % j == 0 {
      // allFactors[j] is NOT prime factor of number
      break
    }
    
  }
  
}
findGoldbachsConjecture(for: 4) */

class Solution {
  func isPrime(_ num: Int) -> Bool {
    if num < 2 {
      return false
    }
    if num == 2 || num == 3 {
      return true
    }
    let upper = Int(sqrt(Double(num)))
    for i in 2 ... upper {
      if num % i == 0 {
        return false
      }
    }
    
    return true
  }
  
  func nextPrimeNum(_ num: Int) -> Int {
    var next = num + 1
    while num < .max {
      if isPrime(next) {
        return next
      }
      next += 1
    }
    
    return 0
  }
  
  func primesum(_ A: inout Int) -> [Int] {
    
    if A % 2 != 0 {
      return []
    }
    
    if A <= 2 {
      return []
    }
    
    var next = 2
    while next < A {
      let num = A - next
      if isPrime(num) {
        return [next, num]
      }
      next = nextPrimeNum(next)
    }
    return []
  }
  
}
//---------------------

/* Given a column title as appears in an Excel sheet, return its corresponding column number.
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 AC -> 29
 AAA -> 703
 */
class Excel {
  func titleToNumber(_ column: inout String) -> Int {
    guard column.isEmpty == false else { return 0 }
    
    var result = 0
    let reverseColumn: [Character] = column.reversed()
    for index in 0..<Int(column.count) {
      result += number(by: reverseColumn[index])*Int(truncating: NSDecimalNumber(decimal: Decimal(pow(Double(26), Double(index)))))
    }
    return result
  }
  
  private func number(by letter: Character) -> Int {
    switch letter {
    case "A": return 1
    case "B": return 2
    case "C": return 3
    case "D": return 4
    case "E": return 5
    case "F": return 6
    case "G": return 7
    case "H": return 8
    case "I": return 9
    case "J": return 10
    case "K": return 11
    case "L": return 12
    case "M": return 13
    case "N": return 14
    case "O": return 15
    case "P": return 16
    case "Q": return 17
    case "R": return 18
    case "S": return 19
    case "T": return 20
    case "U": return 21
    case "V": return 22
    case "W": return 23
    case "X": return 24
    case "Y": return 25
    case "Z": return 26
    default: return 0
    }
  }
}

extension String {
  
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
}

// GCD of 2 non negative integers m and n is defined as the greatest integer g such that g is a divisor of both m and n.
func findGCD(A: Int, B: Int) -> Int {
  var gcd = 0
  guard A > 0, B > 0 else { return gcd }
  if A == 1 || B == 1 { return 1 }
    if A == 0 { return B }
    if B == 0 { return A }
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
findGCD(A: 0, B: 1)

//Given a set of digits (A) in sorted order, find how many numbers of length B are possible whose value is less than number C.
/*
     Input:
     A: 0 1 5  
     B: 1  
     C: 2  
     Output:  
     2 (0 and 1 are possible)  
     
     Input:
     A:  0 1 2 5  
     B:  2  
     C:  21  
     Output:
     5 (10, 11, 12, 15, 20 are possible)
*/
func solveIt(A: [Int], B: Int, C: Int) -> Int {
  var possibilities = 0
  for i in A {
    let numberOfDigits = Int(String(i).count) 
    if i < C && numberOfDigits == B {
      possibilities = possibilities + 1
    }
  }
  return possibilities
}
solveIt(A: [0, 1, 2, 5], B: 2, C: 21)
func getDigits(_ value: Int) -> [Int] {
  
  var result: [Int] = []
  
  var currentNumber = value
  while currentNumber > 0 {
    let digit = currentNumber % 10
    result.insert(digit, at: 0)
    currentNumber /= 10
  }
  
  return result
}

func solve(_ A: inout [Int], _ B: inout Int, _ C: inout Int) -> Int {
  
  var digits = getDigits(C)
  let d = A.count
  
  if B > digits.count || d == 0 {
    
    return 0
    
  } else if B < digits.count {
    
    // check if A contains 0
    if A[0] == 0 && B != 1 {
      return (d - 1) * Int(pow(Double(d), Double(B - 1)))
    } else {
      return Int(pow(Double(d), Double(B)))
    }
    
  } else {
    
    var dp = Array(repeating: 0, count: B + 1)
    var lower = Array(repeating: 0, count: 11)
    
    for i in 0..<d {
      lower[A[i] + 1] = 1
    }
    
    for i in 1...10 {
      lower[i] += lower[i - 1]
    }
    
    var flag = true
    dp[0] = 0
    
    for i in 1...B {
      
      var d2 = lower[digits[i - 1]]
      dp[i] = dp[i - 1] * d
      
      // for the first index we can't use 0
      if i == 1 && A[0] == 0 && B != 1 {
        d2 -= 1
      }
      
      // whether (i - 1) digit of generated number
      // can be equal to (i - 1) digit of C
      if flag {
        dp[i] += d2
      }
      
      // is digit[i - 1] present in A ?
      flag = flag && (lower[digits[i - 1] + 1] == lower[digits[i - 1]] + 1)
    }
    return dp[B]
  }
}

// Graph Q: The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (7 x 3, 21 squares). How many possible unique paths are there?
// assuming want to use DFS because have to count path all the way to the finish. Scratch that, I think BFS because need to find all paths.
func uniquePaths(A: Int, B: Int) -> Int {
  if (A <= 1) || (B <= 1) { return 1 }
  
  var grid: [[Int]] = []
  
  var row = [Int]()
  
  for _ in 0..<B {
    row.append(1)
  }
  
  for _ in 0..<A {
    grid.append(row)
  }
  
  for i in 1..<A {
    for j in 1..<B {
      grid[i][j] = grid[i-1][j] + grid[i][j-1]
    }
  }
  
  return grid[A-1][B-1]
  // If Tree has N nodes, then it has, at most, N-1 edges. Can have less edges than N-1
}
uniquePaths(A: 3, B: 7)

// Given an integer array, find if an integer p exists in the array such that the number of integers greater than p in the array equals to p
func solve(A: [Int]) -> Int {
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

  /*
  var chosenOne = -1
  guard !A.isEmpty else { return chosenOne }
  
  let sortedArray = A.filter { number -> Bool in
    return number < 0 ? false : true
  }
  
  for p in sortedArray {
    let index = sortedArray.index(of: p)
    let subArray = Array(sortedArray.dropFirst(index! + 1))

    if abs(p) == subArray.count {
      chosenOne = 1
      break
    }
  }
  return chosenOne
  */
}
solve(A: [ -1, -2, 0, 0, 0, -3 ])

// Given a list of non negative integers, arrange them such that they form the largest number.
func largestNumberMisread(_ A: [Int]) -> String {
  let tempStringArray = A.map { String($0) }
  var transitionArray = [String]()
  for string in tempStringArray {
    if string.count > 1 {
      for char in string {
        transitionArray.append(String(char))
      }
    } else {
      transitionArray.append(string)
    }
  }
  
  let numberString = transitionArray.map { Int($0) }.sorted { $0! > $1!}.flatMap { $0 }.map { String($0) }
  return numberString.joined()
}
largestNumberMisread([3, 30, 34, 5, 9])
// Given a list of non negative integers, arrange them such that they form the largest number.
// Don't break apart numbers
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
func largestNumberCorrect(_ A: [Int]) -> String {
  let numString = A
    .lazy
    .map { String($0) }
    .sorted { (a: String, b: String) in
      return a+b > b+a
    }
    .joined(separator: "")
  
  return numString.first != "0" ? numString : "0"
}
largestNumber([3, 30, 34, 5, 9])
largestNumberCorrect([3, 30, 34, 5, 9])


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

/*
 Write an efficient algorithm that searches for a value in an m x n matrix.
 This matrix has the following properties:
  1) Integers in each row are sorted from left to right.
  2) The first integer of each row is greater than or equal to the last integer of the previous row.
*/

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

//Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string. If the last word does not exist, return 0.
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
lengthOfLastWord("Hwllo World  ")

/*
 Pretty print a json object using proper indentation.
 
 Every inner brace should increase one indentation to the following lines.
 Every close brace should decrease one indentation to the same line and the following lines.
 The indents can be increased with an additional ‘\t’
 Example 1:
 
 Input : {A:"B",C:{D:"E",F:{G:"H",I:"J"}}}
 Output : 
 { 
    A:"B",
    C: 
    { 
        D:"E",
        F: 
        { 
            G:"H",
            I:"J"
        } 
    } 
 }
*/

func winner(andrea: [Int], maria: [Int], s: String) -> String {
  var andreaTotal = 0
  var mariaTotal = 0
  let isEven = s == "Even" ? true : false
  for i in 0..<andrea.count {
    if isEven {
      if i % 2 == 0 {
        andreaTotal = andreaTotal + andrea[i] - maria[i]
        mariaTotal = mariaTotal + maria[i] - andrea[i]
      }
    } else {
      if i % 2 != 0 { 
        andreaTotal = andreaTotal + andrea[i] - maria[i]
        mariaTotal = mariaTotal + maria[i] - andrea[i]
      }
    }
  }
  print("andreaTotal: \(andreaTotal), mariaTotal: \(mariaTotal)")
  var result = "Tie"
  if andreaTotal > mariaTotal {
    result = "Andrea"
  } else if mariaTotal > andreaTotal {
    result = "Maria"
  }
  return result
}
winner(andrea: [1, 2, 3], maria: [2, 1, 3], s: "Even")

func buildSubsequences(s: String) -> [String] {
  let sortedS = s.sorted()
  var subsequences = [String]()
  
  for char in sortedS {
    subsequences.append(String(char))
    for i in 1..<sortedS.count {
      let charAndNext = String(char) + String(sortedS[i])
      let charAndRestOfString = String(char) + sortedS[i..<sortedS.endIndex]
      subsequences.append(contentsOf: [charAndNext, charAndRestOfString])
    }
    if char == sortedS[0] {
      subsequences.append(String(sortedS))
    }
  }
  
  return subsequences
}
buildSubsequences(s: "ba")

func degreeOfArray(arr: [Int]) -> Int {
  var lengthMinSubArray = 0
  var itemCountDict = [Int : Int]()
  
  for i in 0..<arr.count {
    let iRepeats = arr.filter{$0 == arr[i]}.count
    let isDuplicate = iRepeats > 1 
    if isDuplicate {
      if itemCountDict[arr[i]] != nil {
        if lengthMinSubArray == 0 {
          lengthMinSubArray = i - itemCountDict[arr[i]]! + 1
        }
        if i - itemCountDict[arr[i]]! < lengthMinSubArray {
          lengthMinSubArray = i - itemCountDict[arr[i]]! + 1
        }
      } else {
        itemCountDict[arr[i]] = i 
      }
    }
  }
  
  return lengthMinSubArray
}
struct Repeats {
  var index: Int
  var value: Int
  
  init(index: Int, value: Int) {
    self.index = index
    self.value = value
  }
  
}
degreeOfArray(arr: [1, 2, 2, 3, 1])
degreeOfArray(arr: [5,1,2,3,2,1])
degreeOfArray(arr: [6,1,1,2,1,2,2])



