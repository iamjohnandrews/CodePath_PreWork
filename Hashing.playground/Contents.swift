//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array A of integers and another non negative integer k, find if there exists 2 indices i and j such that A[i] - A[j] = k, i != j.
 
 Example :
 
 Input :
 
 A : [1 5 3]
 k : 2
 Output :
 
 1
 as 3 - 1 = 2
 
 Return 0 / 1 for this problem.
 */
func diffPossible(_ A: [Int], _ B: inout Int) -> Int {
  var map = [Int: Int]()
  
  for i in 0..<A.count {
    //print("i = \(i)")
    if let _ = map[A[i]] {
      //print("val1 = \(A[i])")
      return 1
    }
    
    
    map[A[i]-B] = 1
    map[A[i]+B] = 1
  }
  
  return 0
}

/*
 
 Given an array A of integers, find the index of values that satisfy A + B = C + D, where A,B,C & D are integers values in the array
 
 Note:
 
 1) Return the indices `A1 B1 C1 D1`, so that 
 A[A1] + A[B1] = A[C1] + A[D1]
 A1 < B1, C1 < D1
 A1 < C1, B1 != D1, B1 != C1 
 
 2) If there are more than one solutions, 
 then return the tuple of values which are lexicographical smallest. 
 
 Assume we have two solutions
 S1 : A1 B1 C1 D1 ( these are values of indices int the array )  
 S2 : A2 B2 C2 D2
 
 S1 is lexicographically smaller than S2 iff
 A1 < A2 OR
 A1 = A2 AND B1 < B2 OR
 A1 = A2 AND B1 = B2 AND C1 < C2 OR 
 A1 = A2 AND B1 = B2 AND C1 = C2 AND D1 < D2
 Example:
 
 Input: [3, 4, 7, 1, 2, 9, 8]
 Output: [0, 2, 3, 5] (O index)
 If no solution is possible, return an empty list.
 
Objective- C
-(NSMutableArray *) equal:(NSMutableArray *) A  {
  
  NSMutableDictionary *hash = [NSMutableDictionary new];
  
  int i=0;
  while (i<A.count) { //hash A into key:Array
    
    NSNumber *current = [A objectAtIndex:i];
    
    NSArray *array = [hash objectForKey:current];
    // NSNumber *index = [hash objectForKey:current];
    if (!array) {
      array = [NSMutableArray new];
    }
    [array addObject:@(i)];
    
    [hash setObject:array forKey:current];
    i++;
  }
  
  //test for hash      
  // NSNumber *test = [[hash objectForKey:@(3)] objectAtIndex:0];
  
  //     return @[test];
  
  
  
  int j=0;
  int k = 0;
  int l = 0;
  int cIndex = 0;
  while (j<A.count) {
    
    k=j+1;
    while (k < A.count) {
      
      l = j+1;
      while (l < A.count) {
        if (l != k) {
          
          
          
          int a = [[A objectAtIndex:j] intValue];
          int b = [[A objectAtIndex:k] intValue];
          int c = [[A objectAtIndex:l] intValue];
          
          NSNumber *target = @(a+b-c);
          
          NSArray *array = [hash objectForKey:target];
          
          if (array) {
            
            int m = 0;
            while (m<array.count) {
              int temp = [[array objectAtIndex:m] intValue];
              cIndex = 0;
              if (temp > l && temp != k) {
                cIndex = temp;
                NSArray *solution = @[@(j), @(k), @(l), @(cIndex)];
                return solution;
              }
              m++;
            }
            
            
            
          }
        }
        l++;
      }
      k++;
    }
    
    
    j++;
  }
  
  return @[];
}
*/



// O(n^2) time O(n^2)space attempt
// @implementation Solution
//   -(NSMutableArray *) equal:(NSMutableArray *) A  {

//     NSMutableArray *array = [NSMutableArray new];


//   int i=0;
//   while (i<A.count) {
//       NSMutableDictionary *hash = [NSMutableDictionary new];


//       i++;
//   }




//   return A;
//   }
// @end

/*
 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in linear time complexity.
 Note that when the count of a character C in T is N, then the count of C in minimum window in S should be at least N.
 
 Example :
 
 S = "ADOBECODEBANC"
 T = "ABC"
 Minimum window is "BANC"
  
  string minWindow(string S, string T) {
  if (S.length() < T.length()) return "";
  unordered_map<char, int> counts;
  for (int i = 0; i < T.length(); i++) {
  if (counts.find(T[i]) == counts.end()) {
  counts[T[i]] = 1;
  } else {
  counts[T[i]]++;
  }
  }
  int start = 0;
  int length = 0;
  int total = 0;
  for (int head = 0, tail = 0; tail < S.length(); tail++) {
  auto itTail = counts.find(S[tail]);
  if (counts.find(S[tail]) == counts.end()) {
  // If this character is not present in T at all, 
  // we don't care about this character. 
  continue;
  }
  counts[S[tail]]--;
  // We check if the current character represented by tail caused
  // a character to be included which is relevant to T and is still
  // in deficit. 
  // For example, if T has 3 As, then the first 3 A are relevant to us
  // but the 4th one is not. 
  if (counts[S[tail]] >= 0) {
  total++;
  }
  // check if we have all characters in T covered. 
  if (total == T.size()) {
  // Now move the head pointer till popping out those characters 
  // still makes sure that all characters in T are covered. 
  while (counts.find(S[head]) == counts.end() || counts[S[head]] < 0) {
  if (counts.find(S[head]) != counts.end()) counts[S[head]]++;
  head++;
  }
  // Now [head - 1, tail] is a valid substring. Update the answer. 
  if (length == 0 || tail - head + 1 < length) {
  length = tail - head + 1;
  start = head;
  }
  }
  }
  return S.substr(start, length);
  }
*/
/*
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 
 If the fractional part is repeating, enclose the repeating part in parentheses.
 
 Example :
 
 Given numerator = 1, denominator = 2, return "0.5"
 Given numerator = 2, denominator = 1, return "2"
 Given numerator = 2, denominator = 3, return "0.(6)"
JS

module.exports = { 
  //param A : integer
  //param B : integer
  //return a strings
  fractionToDecimal : function(A, B){
    var signForAB;
    if (B == 0) {
      return "Invalid input format";
    } 
    var sign = function(x) {
      x = +x; // convert to a number
      if (x === 0 || isNaN(x)) {
        return Number(x);
      }
      return x > 0 ? 1 : -1;
    }
    if ((sign(A) == -1 && sign(B) != -1) ||
      (sign(B) == -1 && sign(A) != -1)) 
    {
      signForAB = "-";
    }
    
    // Use positives for the math
    A = (sign(A) === -1) ? A * -1 : A;
    B = (sign(B) === -1) ? B * -1 : B;
    
    var result = Math.floor(A/B),
    remainderHash = {},
    remainder = A % B;
    
    if  (remainder != 0) {
      result = result + '.';
      remainderHash[remainder] = result.length -1;
    }
    
    while (remainder != 0) {
      remainder = remainder * 10;
      var quot = Math.floor(remainder/B);
      remainder = remainder % B;
      
      if (remainderHash[remainder] != undefined) {
        // set parenthesis around last result
        var indexOfRepeat = remainderHash[remainder]+1;
        result = result + quot;
        var repeat = result.substring(indexOfRepeat);
        result = result.substring(0, indexOfRepeat); 
        result += "("+repeat+")";
        //set remainder to zero to stop
        remainder = 0;
      }
      else {
        result = result + quot;
        remainderHash[remainder] = result.length - 1;
      }
    }    
    
    if (signForAB && result != "0") {
      result = signForAB + result;
    }
    
    return result;
  }
  
};
*/

/*
 For Given Number N find if its COLORFUL number or not
 
 Return 0/1
 
 COLORFUL number:
 
 A number can be broken into different contiguous sub-subsequence parts. 
 Suppose, a number 3245 can be broken into parts like 3 2 4 5 32 24 45 324 245. 
 And this number is a COLORFUL number, since product of every digit of a contiguous subsequence is different
 Example:
 
 N = 23
 2 3 23
 2 -> 2
 3 -> 3
 23 -> 6
 this number is a COLORFUL number since product of every digit of a sub-sequence are different. 
 
 Output : 1
 */
// find all the possible combinations
// find the products of each one of them
// remember the products in hash table, see if there's any repeat
  func colorful(_ A: inout Int) -> Int {
    let digits = getDigits(A)
    var combo = [Int]()
    getCombo(digits, 0, &combo)
    var hash = [Int: Bool]()
    for number in combo {
      var product: Int {
        var totalProduct = 1
        var num = number
        while num > 0 {
          let digit = num%10
          totalProduct *= digit
          num = num/10
        }
        return totalProduct
      }
      //        print("\(number) \(product)")
      if hash[product] != nil {
        return 0
      }
      hash[product] = true
    }
    return 1
  }
  
  func getCombo(_ digits: [Int], _ index: Int, _ result: inout [Int]) -> [Int] {
    let currentDigit = digits[index]
    var currentCombo = [Int]()
    currentCombo.append(currentDigit)
    result.append(currentDigit)
    if index == digits.count - 1 {
      return currentCombo
    } else {
      let nextCombo = getCombo(digits, index + 1, &result)
      for combo in nextCombo {
        let number = combo * 10 + currentDigit
        result.append(number)
        currentCombo.append(number)
      }
    }
    return currentCombo
  }
  
  func getDigits(_ A: Int) -> [Int] {
    var digits = [Int]()
    var a = A
    while a > 0 {
      let digit = a%10
      digits.append(digit)
      a = a/10
    }
    
    return digits
}

/*
 Given an array of integers, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 < index2. Please note that your returned answers (both index1 and index2 ) are not zero-based. 
 Put both these numbers in order in an array and return the array from your function ( Looking at the function signature will make things clearer ). Note that, if no pair exists, return empty list.
 
 If multiple solutions exist, output the one where index2 is minimum. If there are multiple solutions with the minimum index2, choose the one with minimum index1 out of them.
 
 Input: [2, 7, 11, 15], target=9
 Output: index1 = 1, index2 = 2
*/
func twoSumMyWay(_ A: [Int], _ B: Int) -> [Int] {
  var indicies = [Int]()
  for i in 0..<A.count {
    let missingPiece = B - A[i]
    if A.contains(missingPiece) {
      
      let largeIndex2 = i > A.index(of: missingPiece)! ? i : A.index(of: missingPiece)!
      let smallIndex1 = i < A.index(of: missingPiece)! ? i : A.index(of: missingPiece)!
//      let largeIndex2: Int
//      let smallIndex1: Int
//      if i > A.index(of: missingPiece)! {
//        largeIndex2 = i
//        smallIndex1 = A.index(of: missingPiece)!
//      } else if i < A.index(of: missingPiece)! {
//        largeIndex2 = A.index(of: missingPiece)!
//        smallIndex1 = i
//      } else {
//        // there are duplicates in A array
//        smallIndex1 = i
//        var array = A
//        array.remove(at: A[i])
//        largeIndex2 = array.index(of: missingPiece)!
//      }
      
      if indicies.isEmpty {
        indicies.append(contentsOf: [smallIndex1 + 1, largeIndex2 + 1])
      } else if indicies[1] > A[largeIndex2] {
        indicies[0] = smallIndex1 + 1
        indicies[1] = largeIndex2 + 1
      } else if indicies[1] == A[largeIndex2] && indicies[0] > A[smallIndex1] {
        indicies[0] = smallIndex1 + 1
        indicies[1] = largeIndex2 + 1
      }
    }
  }
  return indicies
}
twoSumMyWay([ 4, 7, -4, 2, 2, 2, 3, -5, -3, 9, -4, 9, -7, 7, -1, 9, 9, 4, 1, -4, -2, 3, -3, -5, 4, -7, 7, 9, -4, 4, -8 ], -3)
//twoSum([1,1,1], 2)
func twoSum(_ A: [Int], _ B: inout Int) -> [Int] {
  var dict:[Int: Int] = [:]
  var answer:[Int] = []
  for i in 0..<A.count {
    if dict[A[i]] != nil {
      answer.append(dict[A[i]]! + 1)
      answer.append(i + 1)
      break
    } else {
      let needed = B - A[i]
      if dict[needed] == nil {
        dict[needed] = i
      }
    }
  }
  
  
  return answer
}

/*
 Given a string, 
 find the length of the longest substring without repeating characters.
 
 Example:
 
 The longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3.
 
 For "bbbbb" the longest substring is "b", with the length of 1.
 */
func lengthOfLongestSubstring(_ A: String) -> Int {
  var dict = [Character : Character]()
  let removedWhiteSpaces =  A.components(separatedBy: .whitespaces).joined().lowercased()
  for char in removedWhiteSpaces {
    dict[char] = char
  }
  return dict.count
}
//lengthOfLongestSubstring("abcabcBb99")
lengthOfLongestSubstring("A : Wnb9z9dMc7E8v1RTUaZPoDNIAXRlzkqLaa97KMWLzbitaCkRpiE4J4hJWhRcGnC8H6mwasgDfZ76VKdXhvEYmYrZY4Cfmf4HoSlchYWFEb1xllGKyEEmZOLPh1V6RuM7Mxd7xK72aNrWS4MEaUmgEn7L4rW3o14Nq9l2EN4HH6uJWljI8a5irvuODHY7A7ku4PJY2anSWnfJJE1w8p12Ks3oZRxAF3atqGBlzVQ0gltOwYmeynttUmQ4QBDLDrS4zn4VRZLosOITo4JlIqPD6t4NjhHThOjJxpMp9fICkrgJeGiDAwsb8a3I7Txz5BBKV9bEfMsKNhCuY3W0ZHqY0MhBfz1CbYCzwZZdM4p65ppP9s5QJcfjadmMMi26JKz0TVVwvNA8LP5Vi1QsxId4SI19jfcUH97wmZu0pbw1zFtyJ8GAp5yjjQTzFIboC1iRzklnOJzJld9TMaxqvBNBJKIyDjWrdfLOY8FGMOcPhfJ97Dph35zfxYyUf4DIqFi94lm9J0skYqGz9JT0kiAABQZDazZcNi80dSSdveSl6h3dJjHmlK8qHIlDsqFd5FMhlEirax8WA0v3NDPT8vPhwKpxcnVeu14Gcxr3h1wAXXV0y7Xy9qqB2NQ5HQLJ7cyXAckEYHsLCPSy28xcdNJatx1KLWohOQado4WywJbGvsFR17rKmvOPABweXnFD3odrbSMD4Na4nuBBswvMmFRTUOcf7jZi4z5JnJqXz6hitaPnaEtjoSEBq82a52nvqYy7hhldBoxen2et2OMadVEHeTYLL7GLsIhTP6UizHIuzcJMljo4lFgW5AyrfUlIBPAlhwaSiJtTvcbVZynDSM6RO1PqFKWKg2MHIgNhjuzENg2oFCfW7z5KJvEL9qWqKzZNc0o3BMRjS0  4NCHFvhtsteQoQRgz84XZBHBJRdekCdcVVXu9c01gYRAz7oIAxN3zKZb64EFKssfQ4HW971jv3H7x5E9dAszA0HrKTONyZDGYtHWt4QLhNsIs8mo4AIN7ecFKewyvGECAnaJpDn1MTTS4yTgZnm6N6qnmfjVt6ZU51F9BxH0jVG0kovTGSjTUkmb1mRTLQE5mTlVHcEz3yBOh4WiFFJjKJdi1HBIBaDL4r45HzaBvmYJPlWIomkqKEmQ4rLAbYG7C5rFfpMu8rHvjU7hP0JVvteGtaGn7mqeKsn7CgrJX1tb8t0ldaS3iUy8SEKAo5IZHNKOfEaij3nI4oRVzeVOZsH91pMsA4jRYgEohubPW8ciXwVrFi1qEWjvB8gfalyP60n1fHyjsiLW0T5uY1JzQWHKCbLVh7QFoJFAEV0L516XmzIo556yRH1vhPnceOCjebqgsmO78AQ8Ir2d4pHFFHAGB9lESn3OtJye1Lcyq9D6X93UakA3JKVKEt6JZDLVBMp4msOefkPKSw59Uix9d9kOQm8WCepJTangdNSOKaxblZDNJ5eHvEroYacBhd9UdafEitdF3nfStF7AhkSfQVC61YWWkKTNdx96OoJGTnxuqt4oFZNFtO7aMuN3IJAkw3m3kgZFRGyd3D3wweagNL9XlYtvZwejbjpkDOZz33C0jbEWaMEaUPw6BG49XqyQoUwtriguO0yvWyaJqD4ye3o0E46huKYAsdKAq6MLWMxF6tfyPVaoqOGd0eOBHbAF89XXmDd4AIkoFPXkAOW8hln5nXnIWP6RBbfEkPPbxoToMbV")

