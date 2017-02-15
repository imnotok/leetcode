//
//  3.Longest Substring Without Repeating Characters.swift
//  leetcode
//
//  Created by BJ.y on 17/2/10.
//  Copyright © 2017年 BJ.y. All rights reserved.
//

/*
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 

 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring
*/

import Foundation

//方法1
func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLen = 0
    var start = -1
    var data = Array (repeating: -1 , count: 256)
    var i = 0
    
    for c in s.unicodeScalars {
        if data[Int(c.value)] > start {
            start = data[Int(c.value)]
        }
        data[Int(c.value)] = i
        maxLen = max(maxLen, i - start);
        i += 1
    }
    return maxLen;
}

//可以查找出字符串
func lengthOfLongestSubstring2(_ s: String) -> Int {
    var temp = ""
    var maxLength = 0
    
    for i in s.characters {
        let index = temp.characters.index(of: i)
        if (index != nil) {
            if temp.characters.count > maxLength {
                maxLength = temp.characters.count
            }
            //print(temp, temp.characters.count, maxLength)
            if temp.characters.count > 1 {
                let subIndex: String.Index = temp.index(index!, offsetBy:1)
                temp = temp.substring(from: subIndex)
            }
            else {
                temp = ""
            }
            temp.append(i)
           
        }
        else {
            temp.append(i)
        }
    }
    if temp.characters.count > maxLength {
        maxLength = temp.characters.count
    }
    
    return maxLength
}


func testLengthOfLongestSubstring() -> Void {
    print(lengthOfLongestSubstring("bbbb"))
}



