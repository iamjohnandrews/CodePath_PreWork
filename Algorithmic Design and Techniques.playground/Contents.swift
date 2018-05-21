//: Playground - noun: a place where people can play

import UIKit

func sumOfTwoDigits(a: Int, b: Int) -> Int {
  return a + b
}

var twoDigitsSum: (Int, Int) -> Int = { $0 + $1 } 

func maximumPairwiseProduct(array: [Int]) -> Int {
  guard array.count > 1, 
    let max = array.max(),
    let maxIndex: Int = array.index(of: max)
    else { return 0 }  
  return max * secondHighestInt(array, maxIndex)
}

var secondHighestInt: ([Int], Int) -> Int = {
  guard $0.count > 1 else { return 0 }
  var mutableArray = $0
  mutableArray.remove(at: $1)
  return mutableArray.max()!
}

// 0, 1, 1, 2, 3, 5, 8, 13, 21
func retrieveFibonacciNumbers(upTo index: Int) -> [Int] { // not optimal because linear, O(n)
  var numbers = [0, 1]
  if index > 1 {
    for _ in 2...index {
      let nextDigit = numbers.last! + numbers[numbers.count-2]
      numbers.append(nextDigit)
    }
    return numbers
  } else if index == 1 {
    return numbers
  } else {
    return [0]
  }
}

func recursionFibonacciNumbers(upTo index: Int, sequence: [Int] = [0, 1]) {
  guard index > 2 else { return }
  var numbers = sequence
  let i = numbers.count
  
  if i == index + 1 { //add one because array count starts at position zero
    print("\(numbers)")
    return
  } 
  
  let nextValue = numbers[i - 1] + numbers[i - 2]
  numbers.append(nextValue)
  recursionFibonacciNumbers(upTo: index, sequence: numbers)
}

var getFibonacciNumberAtIndex: (Int) -> Int? = {
//  let fibSequence = retrieveFibonacciNumbers(upTo: index)
  guard let fibSequence = recursionGetFibonacciNumbers(upTo: $0),
  let result = fibSequence.last else { return nil }
  return result
}

func recursionGetFibonacciNumbers(upTo index: Int, sequence: [Int] = [0, 1]) -> [Int]? {
  guard index > 2 else { return nil }
  var numbers = sequence
  let i = numbers.count
  
  if i == index + 1 { return numbers } 
  
  let nextValue = numbers[i - 1] + numbers[i - 2]
  numbers.append(nextValue)
  return recursionGetFibonacciNumbers(upTo: index, sequence: numbers)
}

sumOfTwoDigits(a: 3, b: 5)
maximumPairwiseProduct(array: [3,6,5,9,14,16])
twoDigitsSum(4, 6)
retrieveFibonacciNumbers(upTo: 7)
getFibonacciNumberAtIndex(6)
recursionFibonacciNumbers(upTo: 6)

// Greatest Common Denominator 
func gcd(a: Int, b: Int) -> Int {
  var t = 0
  var numberA = a
  var numberB = b
  while numberB != 0 {
    t = numberB
    numberB = numberA % numberB
    numberA = t
  }
  return numberA
}

// Least Common Multiple
func lcm(a: Int, b: Int) -> Int { // inefficient because linear
  var lcm = a * b
  for i in 1...(a*b) {
    if i % a == 0, i % b == 0 {
      lcm = i
      break
    }
  }
  return lcm
}
lcm(a: 16, b: 48)
gcd(a: 111, b: 259)

// What is the minimum number of coins with denominations 1, 5, and 10 needed to change 997?
func minNumberOfPenniesNickelsDimesToProvideChange(for value: Int) {
  let numberOfDimes = value / 10
  let remainder = getRemainder(value, 10)
  
  let numberOfNickels = remainder / 5
  let numberOfPennies = getRemainder(remainder, 5)
  print("Total coins: \(numberOfDimes + numberOfNickels + numberOfPennies)")
}

var getRemainder: (Int, Int) -> (Int) = {
  return $0 % $1
}

minNumberOfPenniesNickelsDimesToProvideChange(for: 997)

// assumes using english alphabet and result is unordered
func retrieveRepeatedCharacterCount(from string: String) -> String {
  var stringDict = [Character: Int]()
  for char in string {
    if let value = stringDict[char] {
      stringDict[char] = value + 1
    } else {
      stringDict[char] = 1
    }
  }
  let characterAndCharCount = (stringDict.flatMap { (key, value) -> String? in
    return "\(key)\(value)"
  } as Array).joined()
  
  let characterAndCharCountString = String(describing: characterAndCharCount)
  return string.count > characterAndCharCountString.count ? characterAndCharCountString : string
}

retrieveRepeatedCharacterCount(from: "aabcccccaaa")

// MARK: Recursion
func loopCountupToTenFrom(a: Int) {
  var b = a
  var total = a
  var array = [Int]()
  while b < 10 {
    b = b + 1
    array.append(b)
    total = total + b
  }
  print("loop \(array) and total value: \(total)")
}
func recursionCountupToTenFrom(a: Int) -> Int {
  // base case
  if a > 10 {
    return 0
  }
  //recursive case
  return a + recursionCountupToTenFrom(a: (a + 1))
}
loopCountupToTenFrom(a: 4)
recursionCountupToTenFrom(a: 4)

func getFactorial(for integer: Int) -> Int {
  if integer == 1 { return 1 }
  return integer * getFactorial(for: (integer - 1))
}
getFactorial(for: 5)

func recursivelyAddIntegers( a: Int, b: Int) -> Int {
  /*
   int sum = a;
   for(int i=1; LOOP-CONDITION (i < b + 1); i=i+1){
   sum = sum + 1;    //this will add 1 to sum every iteration
   }
   return sum;
 */
  if b == 0 {
    return a
  }
  return 1 + recursivelyAddIntegers(a: a, b: (b - 1))
}
recursivelyAddIntegers(a: 2, b: 3)
/*
// #warning below func is so wrong
func recursivelyPrintMultiplesOfProduct(from a: Int, and b: Int) -> Int {  
  // base case
  if b == 0 {
    return a
  }
  
  // check if prime because lowest value
  if b % 2 == 0 {
    print("b: \(b) is a multiple of \(a * b)")
  }
  return recursivelyPrintMultiplesOfProduct(from: a, and: b-1)
}
recursivelyPrintMultiplesOfProduct(from: 4, and: 6)
*/
// Collatz conjecture
func collatzNumberOfStepsToGetToOne(from startInt: Int) -> Int {
  // base case
  if startInt == 1 {
    return 0
  }
  //recursive case for even int
  if startInt % 2 == 0 {
    return 1 + collatzNumberOfStepsToGetToOne(from: startInt/2)
  } else {
   //recursive case for odd int
    return 1 + collatzNumberOfStepsToGetToOne(from: 3 * startInt + 1)
  }
}
collatzNumberOfStepsToGetToOne(from: 11)


func findAllFactors(of number: Int) -> [Int] {
  guard number > 1 else {
    return [1]
  }
  var factors = [1]
   /*
   // not the most efficient
  for i in 2...number/2 {
    if number % i == 0 {
      factors.append(i)
    }
  }
   */
  let sqroot = Int(sqrt(Double(number)))
  for i in 2...sqroot {
    if number % i == 0 {
      factors.append(i)
      if i != sqroot {
        factors.append(number/i)
      }
    }
  }
  factors.append(number)
  return factors.sorted()
}
findAllFactors(of: 36)

func isThisPrime(A: Int) -> Bool {
  var isPrime = true
  if A < 2 { return isPrime }
  
  // if you cannot find a factor before the sqrt, then A is prime because factors are in pairs. Therefore sqrt is upper bound
  for i in 2...Int(sqrt(Double(A))) {
    if A % i == 0 {
      // A is not a prime number
      isPrime = false
    }
  }
  return isPrime
}
isThisPrime(A: 36)
isThisPrime(A: 41443)

// Finding Prime numbers - Sieve of Eratosthenes
/*
func findAllPrimeNumbers(upTo number: Int) -> [Int] {
  var primeNumbers = [Int]()
  
  return primeNumbers
}
findAllPrimeNumbers(upTo: 12)
*/
`
isPalindromeReverse(value: "canddnac")

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
func titleToNumber(_ A: String) -> Int {
  let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  if alphabet.contains(A) {
    guard let number = alphabet.index(of: A) else { return 0 }
    // assume end user starts numbering at 1 instead of 0
    return Int(number) + 1
  }

  
  var multiplier = 26
  var value = 1 // will have to add one anyways
  for i in A {
    if let alphabetIndex = alphabet.index(of: String(i)) {
      let distanceFromCharacterToAlphabetStartIndex = alphabetIndex + 1
      let something = multiplier * distanceFromCharacterToAlphabetStartIndex
      value = alphabetIndex
    }
  }
  return value + switchOverValue
}
titleToNumber("ZA")

/*
Find shortest distance between P and Int

  1 - - P - 
  - - 2 - - 
  3 - - - - 
  - - - - 4
  - - - - -
  - - - - -
*/
