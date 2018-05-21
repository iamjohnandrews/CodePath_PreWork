//: Playground - noun: a place where people can play

import UIKit

/*
 Given a singly linked list
 
 L: L0 → L1 → … → Ln-1 → Ln,
 reorder it to:
 
 L0 → Ln → L1 → Ln-1 → L2 → Ln-2 → …
 You must do this in-place without altering the nodes’ values.
 
 For example,
 Given {1,2,3,4}, reorder it to {1,4,2,3}.
 */
/**
 * Definition for singly-linked list.
 * @interface ListNode: NSObject {
 *     NSInteger val;
 *     ListNode *next;
 * }
 * @end
 */
@implementation Solution
-(ListNode *) reorderList:(ListNode *) A  {
  ListNode *headNode = A;
  
  ListNode *slowPointer = A;
  ListNode *fastPointer = slowPointer.next;
  
  while (fastPointer && fastPointer.next) {
    slowPointer = slowPointer.next;
    fastPointer = fastPointer.next.next;
  }
  
  ListNode *firstHalf = headNode;
  ListNode *secondHalf = slowPointer.next;
  
  slowPointer.next = nil;
  secondHalf = [self reverseLinkedList:secondHalf];
  
  ListNode *tempNode = [[ListNode alloc]init];
  ListNode *startNode = tempNode;
  
  while (firstHalf || secondHalf) {
    
    if (firstHalf) {
      tempNode.next = firstHalf;
      tempNode = tempNode.next;
      firstHalf = firstHalf.next;
    }
    
    if (secondHalf) {
      tempNode.next = secondHalf;
      tempNode = tempNode.next;
      secondHalf = secondHalf.next;
    }
  }
  return startNode.next;
  }
  
  - (ListNode *)reverseLinkedList:(ListNode *)A
{
  ListNode *currentNode = A;
  ListNode *previousNode = nil;
  ListNode *nextNode = nil;
  
  while (currentNode) {
    nextNode = currentNode.next;
    currentNode.next = previousNode;
    previousNode = currentNode;
    currentNode = nextNode;
  }
  return previousNode;
}

@end

/*
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
 342 + 465 = 807
 Make sure there are no trailing zeros in the output list
 So, 7 -> 0 -> 8 -> 0 is not a valid response even though the value is still 807.
 */
/**
 * Definition for singly-linked list.
 * @interface ListNode: NSObject {
 *     NSInteger val;
 *     ListNode *next;
 * }
 * @end
 */
@implementation Solution
-(ListNode *) addTwoNumbers:(ListNode *) a :(ListNode *) b  {
  ListNode *list = nil;
  ListNode *head = nil;
  ListNode *node = nil;
  NSInteger temp = 0;
  NSInteger val = 0;
  while (a != nil  || b != nil) {
    temp = temp + (a!=nil?a.val:0) + (b!=nil?b.val:0);
    node = [ListNode new];
    node.val = temp % 10;
    if(list == nil) {
      list = node;
      head = list;
    } else {
      list.next = node;
      list = list.next;
    }
    
    if (a != nil) {
      a = a.next;
    }
    if (b != nil) {
      b = b.next;
    }
    temp = temp/10;
  }
  if (temp != 0) {
    list.next = [ListNode new];
    list.next.val = temp;
    list = list.next;
  }
  return head;
}

@end

/*
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 For example,
 Given 1->4->3->2->5->2 and x = 3,
 return 1->2->2->4->3->5.
 */


/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 * 
 * typedef struct ListNode listnode;
 * 
 * listnode* listnode_new(int val) {
 *     listnode* node = (listnode *) malloc(sizeof(listnode));
 *     node->val = val;
 *     node->next = NULL;
 *     return node;
 * }
 */
/**
 * @input A : Head pointer of linked list 
 * @input B : Integer
 * 
 * @Output head pointer of list.
 */
listnode* partition(listnode* A, int B) {
  listnode *small=NULL,*large=NULL,*i=NULL,*k=NULL;
  while(A)
  {
    if(A->val<B)
    {
      if(small==NULL)
      small=i=A;
      else
      {
        i->next=A;
        i=i->next;
      }
    }
    else 
    {
      if(large==NULL)
      large=k=A;
      else
      {
        k->next=A;
        k=k->next;
      }
    }
    A=A->next;
  }
  if(k)   k->next=NULL;
  if(small==NULL)
  return large;
  i->next=large;
  return small;
}

/*
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
 
 Try solving it using constant additional space.
 
 Example :
 
 Input : 
 
 ______
 |     |
 \/    |
 1 -> 2 -> 3 -> 4
 
 Return the node corresponding to node 3. 
 */
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 * 
 * typedef struct ListNode listnode;
 * 
 * listnode* listnode_new(int val) {
 *     listnode* node = (listnode *) malloc(sizeof(listnode));
 *     node->val = val;
 *     node->next = NULL;
 *     return node;
 * }
 */
/**
 * @input A : Head pointer of linked list 
 * 
 * @Output head pointer of list.
 */
listnode* detectCycle(listnode* A) {
  listnode *p=A,*q=A;
  while(p && p->next){
    p=p->next->next;
    q=q->next;
    if(p==q){
      break;
    }
  }
  if(p!=q){
    return NULL;
  }
  q=A;
  while(p!=q){
    p=p->next;
    q=q->next;
  }
  return p;
}

