//: Playground - noun: a place where people can play

import UIKit

/*
 Given two integers n and k, return all possible combinations of k numbers out of 1 2 3 ... n.
 Make sure the combinations are sorted.
 Within every entry, elements should be sorted. [1, 4] is a valid entry while [4, 1] is not.
 Entries should be sorted within themselves.
 Example :
 If n = 4 and k = 2, a solution is:
 [[1,2], [1,3], [1,4], [2,3], [2,4], [3,4],]
 
 If n = 3 and k = 1, a solution is:
 [[1], [2], [3]]
 
 If n = 2 and k = 2, a solution is:
 [[1,2], [2,2]]
 */
var combos = [[Int]]()
func combine(_ n: Int, _ k: Int) -> [[Int]] {
    
    // safety checks
    
    
    //base case
    if n == 1 {
        return combos
    }
    
    // recursion
    for num in 1...n {
        guard num >= n else { continue }
        combos.append([n, num])
    }
    
    return combine(n - 1, k)
}
// If I was to you iteration, k would be the number of for loops needed

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses of length 2*n.
 For example, given n = 4, a solution set is:
 "(((())))", "(()()())", "(())(())", "()()(())", "(())()()", "()((()))", "((()))()", "()()()()" -> 8
 
 For example, given n = 3, a solution set is:
 "((()))", "(()())", "(())()", "()(())", "()()()" -> 5
 
 For example, given n = 2, a solution set is:
 "(())", "()()" -> 2
 */
func generateParenthesis(_ A: Int) -> [String] {
    // safety
    
    // base case
    
    // recusive case
    return [String]()
}

/*
 Given a collection of integers that might contain duplicates, S, return all possible subsets.
 Note:
 Elements in a subset must be in non-descending order.
 The solution set must not contain duplicate subsets.
 The subsets must be sorted lexicographically.
 Example :
 If S = [1,2,2], the solution is:
 
 [
 [],
 [1],
 [1,2],
 [1,2,2],
 [2],
 [2, 2]
 ]
 */
// this is a factorial direvative. The length of final array is A!
func subsetsWithDup(_ A: [Int]) -> [[Int]] {
    var subsets = [[Int]]()

    return subsets
}

func factorial(of n: Int) -> Int {
    guard n > 0 else { return 0 }
    //base case
    if n == 1 {
        return 1
    }
    return n * factorial(of: n - 1)
}
factorial(of: 4)

/*
 The greatest common divisor (gcd) of two or more non-zero integers is the largest positive integer that divides all the numbers without a remainder.
 
 Write a program that takes as its input two int values > 0 and returns an int value equal to their gcd.
 */
func retrieveGCD(from a: Int, and b: Int) -> Int {
    guard a > 0, b > 0 else { return 0}
    // need Euclidean algorithm
    let modulus = a % b
    return modulus != 0 ? retrieveGCD(from: b, and: modulus) : b
}
retrieveGCD(from: 52, and: 39)

/*
 Write a program that takes as its input an int[] containing 2 or more values and returning all possible permutations of the numbers.
 
 [1,2,3] will have the following permutations:
 
 [1,2,3]
 [1,3,2]
 [2,1,3]
 [2,3,1]
 [3,1,2]
 [3,2,1]
 Note: No two entries in the permutation sequence should be the same. For the purpose of this problem, assume that all the numbers in the collection are unique. Do not use any library functions for generating permutations.
 */




/*
 Pascal's Triangle
 the rth column of nth row = n! / (r! * (n - r)!)
 
 k = 4
 
 Output:
 1
 1 1
 1 2 1
 1 3 3 1
 ----------
 k = 7
 
 Output:
 1
 1 1
 1 2 1
 1 3 3 1
 1 4 6 4 1
 1 5 10 10 5 1
 1 6 15 20 15 6 1
 
 --------
 Try to find pattern
 k = 7
 
 Output:
 1  | sum = 1
 1 1  | sum = 2
 1 2 1  | sum = 4
 1 3 3  1  | sum = 8
 1 4 6  4  1  | sum = 16
 1 5 10 10 5  1  | sum = 32
 1 6 15 20 15 6 1  | sum = 64
 
 therefore, sum or row k = 2(k-1)
 turns out this is equation to get value of any digit in a row n! / (r! * (n - r)!)
 also, the digit after index 0 is the sum of previous two digits from row before
*/

func pascalTriangle(k: Int) {
    //safety checks
    
    
    // base case
    if k == 1 {
        print("1")
        return
    }
    var numbers = [1]
    
    //recursive call

}
//pascalTriangle(k: 4)

func pascalTriangleBinomialCoefficient(_ k: Int) {
    var bc = Array(repeating: Array(repeating: 0, count: k), count: k)
    
    for i in 0..<k {
        bc[i][0] = 1
        bc[i][i] = 1
    }
    
    if k > 0 {
        for i in 1..<k {
            for j in 1..<i {
                bc[i][j] = bc[i - 1][j - 1] + bc[i - 1][j]
            }
        }
    }
    
    // remove 0's
    for array in bc {
        let removedZero = array.filter({ $0 != 0 })
        let row = removedZero.map { String($0)}.joined(separator: " ")
        print(row)
    }
}
pascalTriangleBinomialCoefficient(4)
