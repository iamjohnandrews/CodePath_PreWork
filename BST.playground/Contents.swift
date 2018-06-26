//: Playground - noun: a place where people can play

import UIKit

/*
 Given a binary tree, return the postorder traversal of its nodes’ values.
 
 Example :
 
 Given binary tree
     1
      \
       2
      /
     3
 return [3,2,1].
*/

class TreeNode {
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?
}
var stack = [TreeNode]()

func postorderTraversal(_ A: TreeNode?) -> [Int] {
    var nodes = [Int]()
    guard let treeNode = A else { return nodes }
    
    // get to left subtree leaf
    getDeepestLeftLeaf(treeNode)
    
    for index in stride(from: stack.count - 1, to: 0, by: -1) {
        let node = stack[index]
        if let leftChild = node.left {
            nodes.append(leftChild.val)
        } else if let rightChild = node.right {
            nodes.append(rightChild.val)
        }
    }

    return nodes
}

func getDeepestLeftLeaf(_ node: TreeNode) {
    stack.append(node)
    
    //base case
    guard let leftChild = node.left else { return }
    
    return getDeepestLeftLeaf(leftChild)
}

/*
 Given a binary tree, find its maximum depth.
 
 The maximum depth of a binary tree is the number of nodes along the longest path from the root node down to the farthest leaf node.
 */

func maxDepth(_ A: TreeNode?) -> Int {
    var treeDepth = 0
    guard let treeNode = A else { return treeDepth }
    
    var measuringStick = [treeNode]
    
    while !measuringStick.isEmpty {
        let node = measuringStick.popLast()
        treeDepth = treeDepth + 1
        
        if let leftChild = node?.left {
            measuringStick.append(leftChild)
        }
        if let rightChild = node?.right {
            measuringStick.append(rightChild)
        }
    }
    
    
    return treeDepth
}

/*
 Given a binary tree, return the preorder traversal of its nodes’ values.
 
 Example :
 Given binary tree
 
     1
      \
       2
      /
     3
     return [1,2,3].
 */
func preorderTraversal(_ A: TreeNode?) -> [Int] {
    var nodeValues = [Int]()
    guard let treeNode = A else { return nodeValues }
    
    var tempStack = [treeNode]
    
    while !tempStack.isEmpty {
        let node = tempStack.popLast()
        
        if let leftChild = node?.left {
            nodeValues.append(leftChild.val)
            tempStack.append(leftChild)
        }
        if let rightChild = node?.right {
            nodeValues.append(rightChild.val)
            tempStack.append(rightChild)
        }
    }
    
    return nodeValues
}

func createBST(keys: [Int]) -> Void {
    guard !keys.isEmpty else {
        print("[0]")
        return
    }
    // remove duplicates
    let sortedUniqueKeys = Array(Set(keys)).sorted()
    
    let middleIndex = Int(floor(Double(sortedUniqueKeys.count/2)))
    let bstRoot = TreeNode()
    bstRoot.val = sortedUniqueKeys[middleIndex]
    
    var leftTempStack = [bstRoot]
    var rightTempStack = [bstRoot]
    var keyCounter = 0
    print("\(keyCounter)")
    
    // left subtree
    for i in 0..<middleIndex {
        let parentNode = leftTempStack[i]
        let leftChildNode = TreeNode()
        leftChildNode.val = sortedUniqueKeys[middleIndex - 1 - i]
        parentNode.left = leftChildNode
        leftTempStack.append(leftChildNode)
        keyCounter = keyCounter + 1
        print("\(keyCounter)")
    }
    // right subtree
    for i in middleIndex+1..<sortedUniqueKeys.count {
        var incrementer = 0
        let parentNode = rightTempStack[incrementer]
        let rightChildNode = TreeNode()
        rightChildNode.val = sortedUniqueKeys[i]
        parentNode.left = rightChildNode
        rightTempStack.append(rightChildNode)
        keyCounter = keyCounter + 1
        incrementer = incrementer + 1
        print("\(keyCounter)")
    }
}

createBST(keys: [3, 2, 1, 3])

func isValidBST(from nodes: [TreeNode]) -> Bool {
    var isValid = false
    
    for i in stride(from: nodes.count - 2, to: 0, by: -1) {
        let childNode = nodes[i + 1]
        let parentNode = nodes[i]
        
        if parentNode.left?.val == childNode.val {
            isValid = childNode.val < parentNode.val
        } else
            if parentNode.right?.val == childNode.val {
                isValid = childNode.val > parentNode.val
        }
    }
    
    return isValid
}

func counts(nums: [Int], maxes: [Int]) -> [Int] {
    var valuesBelowMaxesAraay = [Int]()
    guard !nums.isEmpty, !maxes.isEmpty else { return valuesBelowMaxesAraay }
    var counter = 0
    
    //remove duplicates
    let uniqueMaxes = Array(Set(maxes))
    let uniqueNums = Array(Set(nums))
    
    for max in uniqueMaxes {
        for num in uniqueNums {
            if num <= max {
                counter = counter + 1
            }
        }
        valuesBelowMaxesAraay.append(counter)
        counter = 0
    }
    
    return valuesBelowMaxesAraay
}
counts(nums: [4, 1, 4, 2, 4, 2, 3, 5], maxes: [2, 4])

