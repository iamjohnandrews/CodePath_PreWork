//: Playground - noun: a place where people can play

import UIKit
/*
 You are climbing a stair case. It takes n steps to reach to the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 Example :
 
 Input : 3
 Return : 3
 
 Steps : [1 1 1], [1 2], [2 1]
 */
var dict = [Int: Int]()
func climbStairs(_ A: Int) -> Int {
  var stepClimbingVariations = 0
  guard A > 0 else { return stepClimbingVariations }
  
  if A == 1 { return 1 }
  if dict[A] == nil {
    dict[A] = (A - 1) + (A - 2)
  }
  
  return stepClimbingVariations
}
