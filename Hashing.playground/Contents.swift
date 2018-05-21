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
 */
@implementation Solution
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
@end




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
 */
class Solution {
  public:
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
};

/*
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 
 If the fractional part is repeating, enclose the repeating part in parentheses.
 
 Example :
 
 Given numerator = 1, denominator = 2, return "0.5"
 Given numerator = 2, denominator = 1, return "2"
 Given numerator = 2, denominator = 3, return "0.(6)"
JS
 */
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

/*
 You are given a string, S, and a list of words, L, that are all of the same length.
 
 Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.
 
 Example :
 
 S: "barfoothefoobarman"
 L: ["foo", "bar"]
 You should return the indices: [0,9].
 (order does not matter).
 */

