//: Playground - noun: a place where people can play

import UIKit

// Week 1
//Challenge 1 - Implement a Linked List
struct Node {
  var value: Int
  var next: Node?
  
  init(value: Int) {
    self.value = value
  }
}

struct LinkedListNode {
  var head: Node?

  /**
   * Initialize this node and all of its subsequent nodes from
   * an array of values, starting with the head value at index 0
   *
   * @param listValues - the ordered values for the whole list
   */
  func setValuesFromArray(listValues: [Int]) {
    guard !listValues.isEmpty else { return }
    var currentHead = head
    for intValue in listValues {
      let newNode = Node(value: intValue)
      currentHead = newNode
    }
    print("WTF self: \(self) and currentHead: \(currentHead)")
  }
}
let linkedList = LinkedListNode()
linkedList.setValuesFromArray(listValues: [2, 3, 4, 5, 6])
