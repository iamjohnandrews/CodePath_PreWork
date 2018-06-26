//: Playground - noun: a place where people can play

import UIKit
/*
 Given a binary tree, return the level order traversal of its nodes’ values. (ie, from left to right, level by level).
 Example : Given binary tree
    3
   / \
  9  20
    /  \
   15   7
 return its level order traversal as:
 [[3], [9,20],[15,7]]
 */
class TreeNode {
  var val: Int = 0
  var left: TreeNode?
  var right: TreeNode?
}

func levelOrder(_ A: TreeNode?) -> [[Int]] {
  var bfsNodes = [[Int]]()
  guard let root = A else { return bfsNodes }
  var queue = [root]
  bfsNodes.append([root.val])
  
  var neighborsArray = [TreeNode]()
  var row = [Int]()
  
  while !queue.isEmpty {
    let node = queue.removeFirst()
    row.append(node.val)
    
    //check children, left then right
    if let leftChild = node.left {
      neighborsArray.append(leftChild)
    }
    if let rightChild = node.right {
      neighborsArray.append(rightChild)
    }

    if queue.isEmpty {
      bfsNodes.append(row)
      queue = neighborsArray
      neighborsArray = []
      row = []
    }
  }
  
  return bfsNodes
}

// Clone the Graph
class GraphNode {
  var neighbors: [GraphNode]
  var value: Int
  
  init(value: Int) {
    self.value = value
    neighbors = [GraphNode]()
  }
}

//func bfsCloneGraph(from root: GraphNode) -> GraphNode {
//  
//}

func dfsCloneGraph(from root: GraphNode, dict: [Int : GraphNode] = [Int : GraphNode]() ) -> GraphNode {
    
}

