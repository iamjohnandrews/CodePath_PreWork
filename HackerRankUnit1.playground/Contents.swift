//: Playground - noun: a place where people can play

import UIKit

final class SinglyLinkedListNode {
  var data: Int
  var next: SinglyLinkedListNode?
  
  public init(nodeData: Int) {
    self.data = nodeData
  }
}

final class SinglyLinkedList {
  var head: SinglyLinkedListNode?
  var tail: SinglyLinkedListNode?
  
  public init() {}
  
  public func insertNode(nodeData: Int) {
    self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
  }
  
  private func insertNode(node: SinglyLinkedListNode) {
    if let tail = tail {
      tail.next = node
    } else {
      head = node
    }
    
    tail = node
  }
}

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String, fileHandle: FileHandle) {
  var node = head
  
  while node != nil {
    fileHandle.write(String(node!.data).data(using: .utf8)!)
    
    node = node!.next
    
    if node != nil {
      fileHandle.write(sep.data(using: .utf8)!)
    }
  }
}

func removeNodes(listHead: SinglyLinkedListNode?, x: Int) -> SinglyLinkedListNode? {
  // Question: is not sorted
  // Assume: single linked list
  
  guard let head = listHead else { return nil }
  var value = head
  while value.data < x {
    if let nextLink = head.next {
      value = nextLink
    } else {
      break
    }
  }
  value.next = nil
  return value
}

/*
 
*/
func firstRepeatedWord(s: String) -> String {
  // break string into words
  var repeatingString = ""
  let range = s.startIndex..<s.endIndex
  var words = [String]()
  
  s.enumerateSubstrings(in: range,
                        options: .byWords) { (substring, _, _, _) in
                          guard let word = substring else {
                            return
                          }
                          words.append(word)
  }
  
  // check array of words for repeats
  for word in words {
    if words.filter({ $0 == word}).count > 1 {
      repeatingString = word
    }
  }
  return repeatingString
}
firstRepeatedWord(s: "Mike put his putter in his golf bag")
