//
//  2.Add Two Numbers.swift
//  leetcode
//
//  Created by BJ.y on 17/2/9.
//  Copyright © 2017年 BJ.y. All rights reserved.
//

/*
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order and each of their nodes contain a single digit.
 Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var p1:ListNode? = l1
    var p2:ListNode? = l2
    let p:ListNode? = ListNode(0)
    var temp = 0
    var pTemp:ListNode? = p
    
    if l1 == nil && l2 == nil {
        return p;
    }
    while (p1 != nil) || (p2 != nil || temp > 0) {
        let sum = (p1 != nil ? (p1?.val)! : 0) + (p2 != nil ?  (p2?.val)! : 0) + temp
        pTemp?.next = ListNode(sum % 10)
        pTemp = pTemp?.next
        temp = sum / 10
        p1 = (p1 != nil ? p1?.next : nil)
        p2 = (p2 != nil ? p2?.next : nil)
    }
    return p?.next
}

func testAddTwoNumbers() {
    let l11 = ListNode(2)
    let l12 = ListNode(4)
    let l13 = ListNode(3)
    
    l11.next = l12
    l12.next = l13
    l13.next = nil
    
    let l21 = ListNode(5)
    let l22 = ListNode(6)
    let l23 = ListNode(4)
    
    l21.next = l22
    l22.next = l23
    l23.next = nil
    
    let node =  addTwoNumbers(l11, l21)
    var p = node
    while p != nil {
        print((p?.val)! as Int, "->")
        p = p?.next
    }
}



