//: Playground - noun: a place where people can play

import UIKit

/**
 Given a singly linked list, determine if its a palindrome. Return 1 or 0 denoting if its a palindrome or not, respectively.
 * Definition for a linked list node
 */

class ListNode {
  var val: Int = 0
  var next: ListNode?
}
func lPalin(_ A: ListNode?) -> Int {
  var isPalindrome = 0
  guard let object = A else { return isPalindrome }
  var array = [Int]()
  
  while object.next != nil {
    let nextListNode = object.next!
    array.append(nextListNode.val)
  }
  isPalindrome = array == array.reversed() ? 1 : 0
  return isPalindrome
}

/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.

func deleteDuplicates(_ A: ListNode?) -> ListNode? {
  guard let listNode = A else { return nil }
  
  var array = [listNode.val]
  while listNode.next != nil {
    let nextListNode = listNode.next!
    array.append(nextListNode.val)  
  }
  let removedDuplicates = Array(Set(array)).sorted()
  var resultListNode: ListNode? = ListNode()
  
  for item in removedDuplicates {
    resultListNode = constructAndAdd(to: &resultListNode, with: item)
  }
  return resultListNode
}
func constructAndAdd(to listNode: inout ListNode?, with value: Int) -> ListNode? {
  listNode?.val = value
  listNode?.next = ListNode()
  return listNode
}
*/
func deleteDuplicates(_ A: ListNode?) -> ListNode? {
  guard var listNode = A else { return nil }
  
  while listNode {
    var nextListNode = listNode.next
    
    while nextListNode && nextListNode?.val == listNode.val {
      nextListNode = nextListNode?.next
      listNode.next = nextListNode
      listNode = listNode.next!
    }
  }
  return A
}

