//
//  4.Median of Two Sorted Arrays.swift
//  leetcode
//
//  Created by BJ.y on 17/2/13.
//  Copyright © 2017年 BJ.y. All rights reserved.
//

/*
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
*/

import Foundation



func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let num1length = nums1.count
    let num2Length = nums2.count
    
    var position1 = -1;
    var position2 = -1
    
    if (num2Length + num1length) % 2 != 0 {
        position1 = (num1length + num2Length) / 2
        
    }
    else {
        position1 = (num1length + num2Length) / 2 - 1
        position2 = (num1length + num2Length) / 2
    }
    
    var k = 0
    var i = 0
    var j = 0
    
    
    var num1 = 0
    var num2 = 0
    
    
    
    while true {
        if i < num1length && j < num2Length {
            if nums1[i] < nums2[j] {
                if position2 > 0 {
                    if k == position1 {
                        num1 =  nums1[i]
                    }
                    if k ==  position2 {
                        num2 = nums1[i]
                        return Double(num1 + num2) / 2.0
                    }
                }
                else {
                    if k == position1 {
                        return Double(nums1[i])
                    }
                }
                
                i += 1
                k += 1
            }
            else {
                if position2 > 0 {
                    if k == position1 {
                        num1 =  nums2[j]
                    }
                    if k ==  position2 {
                        num2 = nums2[j]
                        return Double(num1 + num2) / 2.0
                    }
                }
                else {
                    if k == position1 {
                        return Double(nums2[j])
                    }
                }
                
                j += 1
                k += 1
            }
        }
        else if i >= num1length && j < num2Length {
            if position2 > 0 {
                if k == position1 {
                    num1 =  nums2[j]
                }
                if k ==  position2 {
                    num2 = nums2[j]
                    return Double(num1 + num2) / 2.0
                }
            }
            else {
                if k == position1 {
                    return Double(nums2[j])
                }
            }
            
            j += 1
            k += 1
        }
        else if i < num1length && j >= num2Length {
            if position2 > 0 {
                if k == position1 {
                    num1 =  nums1[i]
                }
                if k ==  position2 {
                    num2 = nums1[i]
                    return Double(num1 + num2) / 2.0
                }
            }
            else {
                if k == position1 {
                    return Double(nums1[i])
                }
            }
            i += 1
            k += 1
        }
        else {
            break;
        }
    }
    
    return 0.0
}

func testFindMedianSortedArrays() -> Void {
    let nums2 = [1, 2, 3]
    let nums1 = [4, 5, 6, 7, 8, 9]
    print(findMedianSortedArrays(nums1, nums2))
    
    
}
