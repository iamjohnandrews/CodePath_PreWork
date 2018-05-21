//: Playground - noun: a place where people can play

import UIKit

/*
 Given an absolute path for a file (Unix-style), simplify it.
 
 Examples:
 
 path = "/home/", => "/home"
 path = "/a/./b/../../c/", => "/c"
 Note that absolute path always begin with ‘/’ ( root directory )
 Path will not have whitespace characters.
 */
func simplifyPath(_ A: inout String) -> String {
  if A == "" {
    return ""
  }
  
  let ops = A.components(separatedBy: "/")
  var stack: [String] = []
  
  for op in ops {
    switch op {
    case ".":
      continue
    case "..":
      if !stack.isEmpty {
        stack.removeLast()
      }
    case "":
      continue
    default:
      stack.append(op)
    }
  }
  
  var result = "/"
  for (index, value) in stack.enumerated() {
    if index == stack.count - 1 {
      result += "\(value)"
    } else {
      result += "\(value)/"
    }
  }
  
  return result
}

/*
 Given an array, find the nearest smaller element G[i] for every element A[i] in the array such that the element has an index smaller than i.
 
 More formally,
 
 G[i] for an element A[i] = an element A[j] such that 
 j is maximum possible AND 
 j < i AND
 A[j] < A[i]
 Elements for which no smaller element exist, consider next smaller element as -1.
 
 Example:
 
 Input : A : [4, 5, 2, 10, 8]
 Return : [-1, 4, -1, 2, 2]
 
 Example 2:
 
 Input : A : [3, 2, 1]
 Return : [-1, -1, -1]
 */
func prevSmaller(_ A: inout [Int]) -> [Int] {
  if A.count == 0 {
    return A
  }
  
  var previousSmallValues: [Int] = []
  var result: [Int] = []
  
  for value in A {
    
    // look for previous smaller value
    while previousSmallValues.count > 0 {
      let topValue = previousSmallValues[previousSmallValues.count - 1]
      if topValue >= value {
        previousSmallValues.removeLast()
      } else {
        result.append(topValue)
        break
      }
    }
    
    // first time or we popped all of the values off of the stack earlier
    if previousSmallValues.count == 0 {
      result.append(-1)
    }
    
    // add the current value to the stack
    previousSmallValues.append(value)
  }
  
  return result
}

/*
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.
 
 Valid operators are +, -, *, /. Each operand may be an integer or another expression.
 
 Examples:
 
 ["2", "1", "+", "3", "*"] -> ((2 + 1) * 3) -> 9
 ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6
 */
func evalRPN(_ A: inout [String]) -> Int {
  
  // check if input is empty
  guard A.count != 0 else {
    return 0
  }
  
  // store our operands in a stack
  var paramsStack: [Int] = []
  
  // traverse the input array
  for value in A {
    
    // check if A value is a number
    if let number = Int(value) {
      paramsStack.append(number)
      
      // value is an operator, perform operation
    } else {
      
      // get operands
      let secondParam = paramsStack.removeLast()
      let firstParam = paramsStack.removeLast()
      
      // perform operation
      switch value {
      case "+":
        paramsStack.append(firstParam + secondParam)
      case "-":
        paramsStack.append(firstParam - secondParam)
      case "*":
        paramsStack.append(firstParam * secondParam)
      case "/":
        paramsStack.append(firstParam / secondParam)
      default:
        break
      }
    }
  }
  
  // top value on paramStack will have the result of the last operation
  return paramsStack[paramsStack.count - 1]
}

/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) – Push element x onto stack.
 pop() – Removes the element on top of the stack.
 top() – Get the top element.
 getMin() – Retrieve the minimum element in the stack.
 Note that all the operations have to be constant time operations.
 
 Questions to ask the interviewer :
 
 Q: What should getMin() do on empty stack? 
 A: In this case, return -1.
 
 Q: What should pop do on empty stack? 
 A: In this case, nothing. 
 
 Q: What should top() do on empty stack?
 A: In this case, return -1
 */
int stack[10000000];
int tp=-1,min=INT_MAX;

void init() {
  tp=-1;min;
}

void push(int x) {
  if(tp==-1)
  {
    min=x; 
    stack[++tp]=x;
  }
  else
  {
    if(x<min)
    {
      stack[++tp]=2*x-min;
      min=x;
    }
    else
    stack[++tp]=x;
  }
}

void pop() {
  if(tp==-1)
  return;
  if(stack[tp]<min){
    min=2*min-stack[tp];
  }
  tp--;
}

int top() {
  if(tp==-1)
  return -1;
  if(stack[tp]<min)
  return min;
  return stack[tp];
}

int getMin() {
  if(tp==-1)
  return -1;
  return min;
}
