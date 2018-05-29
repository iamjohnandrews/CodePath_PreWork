//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array of integers, sort the array into a wave like array and return it, 
 In other words, arrange the elements into a sequence such that a1 >= a2 <= a3 >= a4 <= a5.....
 Example:
 Given [1, 2, 3, 4]
 One possible answer : [2, 1, 4, 3]
 Another possible answer : [4, 1, 3, 2]
*/
func wave(_ A: [Int]) -> [Int] {
  var waveArray = [Int]()
  guard !A.isEmpty else { return waveArray }
  let roundedHalfPoint = Int(floor(Double(A.count / 2)))
  let left = Array(A.prefix(roundedHalfPoint))
  let right = Array(A.suffix(roundedHalfPoint))
  
  for i in 0..<roundedHalfPoint {
    let leftArrayValue = left[i]
    let rightArrayValue = right[i]
    var insertionArray = [Int]()
    
//    if i % 2 == 0 {
//      if leftArrayValue >= rightArrayValue {
//        insertionArray.append(contentsOf: [leftArrayValue, rightArrayValue])
//      } else {
//        insertionArray.append(contentsOf: [rightArrayValue, leftArrayValue])
//      }
//    } else {
//      if leftArrayValue <= rightArrayValue {
//        insertionArray.append(contentsOf: [leftArrayValue, rightArrayValue])
//      } else {
//        insertionArray.append(contentsOf: [rightArrayValue, leftArrayValue])
//      }
//    }
    
    if i % 2 == 0 {
      // even indexes
      insertionArray = leftArrayValue >= rightArrayValue ? [leftArrayValue, rightArrayValue] : [rightArrayValue, leftArrayValue]
    } else {
      // odd indexes
      insertionArray = leftArrayValue <= rightArrayValue ? [leftArrayValue, rightArrayValue] : [rightArrayValue, leftArrayValue]
    }
    waveArray.append(contentsOf: insertionArray)
  }
  
  return waveArray
}
wave([1, 2, 3, 4])

/*
 Given a non-negative number represented as an array of digits, add 1 to the number ( increment the number represented by the digits ).
 The digits are stored such that the most significant digit is at the head of the list.
 
 Example:
 If the vector has [1, 2, 3] the returned vector should be [1, 2, 4] as 123 + 1 = 124.
*/
func plusOne(_ A: [Int]) -> [Int] {
  var addOneArray = [Int]()
  guard !A.isEmpty else { return addOneArray }
  
  if let lastValue = A.last, lastValue < 9 {
    addOneArray = A
    let newLastValue = lastValue + 1
    addOneArray.remove(at: addOneArray.count - 1)
    addOneArray.append(newLastValue)
  } else if A.count == 1 {
    if A.first! + 1 == 10 {
      addOneArray.append(contentsOf: [1, 0])
    } else {
      addOneArray.append(A.first! + 1)
    }
  } else {
    var reversedArray: [Int] = A.reversed()
    for i in 1..<reversedArray.count {
      reversedArray.remove(at: i - 1)
      reversedArray.insert(0, at: i - 1)
      
      let currentValue = reversedArray[i] + 1
      if currentValue < 10 {
        reversedArray.remove(at: i)
        reversedArray.insert(currentValue, at: i)
        break
      }
      if i == reversedArray.count - 1 && currentValue == 10 {
        reversedArray.remove(at: i)
        reversedArray.insert(0, at: i)
        reversedArray.append(1)
      }
    }
    addOneArray = reversedArray.reversed()
  }
  // remove initial zeros
  for number in addOneArray {
    if number == 0 {
      addOneArray.remove(at: addOneArray.index(of: number)!)
    } else {
      break
    }
  }
  
  return addOneArray
}
//plusOne([ 9, 9, 9, 9, 9 ])
//plusOne([ 6, 4, 7, 7, 8, 9 ])
//plusOne([ 0, 3, 7, 6, 4, 0, 5, 5, 5 ])
plusOne([ 9 ])

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
