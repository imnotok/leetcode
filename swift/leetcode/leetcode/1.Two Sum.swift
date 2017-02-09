//
//  1.Two Sum .swift
//  leetcode
//
//  Created by BJ.y on 17/2/9.
//  Copyright © 2017年 BJ.y. All rights reserved.
//

/*
 Given an array of integers, return indices of the two numbers
 such that they add up to a specific target.
 You may assume that each input would have exactly one solution, 
 and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
*/

import Foundation

//方法1
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count - 1
    for i in 0...count - 1 {
        for j  in (i + 1)...count{
            if nums[j] +  nums[i] == target {
                return[i, j]
            }
        }
    }
    return[]
}

// 方法2
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var findNums:Dictionary<Int, Int> = [:]
    let count = nums.count - 1
    for i in 0...count {
        findNums[nums[i]] = i;
    }
    
    for i in 0...count {
        let d:Int = target - nums[i]
        let t = findNums[d]
        if t != nil {
            let index:Int = t!
            if index != i {
                return[i, index]
            }
        }
    }
    return[]
}




func testTwoSum() -> Void {
    let nums = [3, 2, 4]
    let target = 6
    print(twoSum1(nums, target))
}
