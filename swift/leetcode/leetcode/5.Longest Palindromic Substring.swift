//
//  5.Longest Palindromic Substring.swift
//  leetcode
//
//  Created by BJ.y on 17/2/13.
//  Copyright © 2017年 BJ.y. All rights reserved.
//

/*
 Given a string s, find the longest palindromic substring in s.
 You may assume that the maximum length of s is 1000.
 
 Example:
 
 Input: "babad"
 
 Output: "bab"
 
 Note: "aba" is also a valid answer.
 Example:
 
 Input: "cbbd"
 
 Output: "bb"
 */

import Foundation

//方法一
func longestPalindrome(_ s: String) -> String {
    if s.characters.count <= 1 {
        return s
    }
    
    var min = 0
    var maxLen = 0
    var i = 0
    
    let count = s.characters.count
    while i < count {
        if count - i <= maxLen / 2 {
            break;
        }
        
        var j = i
        var k = i
        
        while k < count - 1
            && s.characters[s.index(s.startIndex, offsetBy: k)] == s.characters[s.index(s.startIndex, offsetBy: k + 1)] {
                k += 1
        }
        
        i = k + 1
        
        while k < s.characters.count - 1 && j > 0 && s.characters[s.index(s.startIndex, offsetBy: k + 1)] == s.characters[s.index(s.startIndex, offsetBy: j - 1)] {
            k += 1
            j -= 1
        }
        
        let len = k - j + 1
        if len > maxLen {
            min = j
            maxLen = len
        }
    }
    
    let startIndex = s.index(s.startIndex, offsetBy: min)
    let endIndex = s.index(startIndex, offsetBy: maxLen)
    return s.substring(with: Range(uncheckedBounds: (lower: startIndex, upper: endIndex)))
}



var lo:Int = 0
var maxLen:Int = 0


func longestPalindrome1(_ s: String) -> String {
    let len = s.characters.count
    if (len < 2) {
        return s;
    }
    
    var i = 0
    while i < len - 1 {
        extendPalindrome(s, i, i);  //assume odd length, try to extend Palindrome as possible
        extendPalindrome(s, i, i + 1); //assume even length.
        i += 1
    }
    let startIndex = s.index(s.startIndex, offsetBy: lo)
    let endIndex = s.index(startIndex, offsetBy: maxLen)
    let t = s.substring(with: Range(uncheckedBounds: (lower: startIndex, upper: endIndex)))
    return t

}

func extendPalindrome(_ s:String, _ j:Int, _ k:Int) ->Void{
    var jT = j
    var kT = k
    
    while (jT >= 0 && kT < s.characters.count && s.characters[s.index(s.startIndex, offsetBy: jT)] == s.characters[s.index(s.startIndex, offsetBy: kT)]) {
        jT -= 1
        kT += 1
    }
    if (maxLen < kT - jT - 1) {
        lo = jT + 1;
        maxLen = kT - jT - 1;
    }
}

///方法二 执行时间长，能找出所有的回文串
func isPalindrome(_ s1:String, _ s2:String, _ evenNum:Bool) -> String {
    if s1.characters.count != s2.characters.count {
        return "";
    }
    var i  = 0
    for index in s2.characters.indices {
        if s2.characters[index] != s1.characters[s1.characters.index(s1.characters.endIndex, offsetBy:-(i + 1))] {
            if evenNum && i >= 1 {
                return s1.substring(from: s1.index(s1.endIndex, offsetBy: -i)) + s2.substring(to: index)
                
            }
            else if (!evenNum && i >= 2) {
                let r = Range(uncheckedBounds: (lower: s1.index(s1.endIndex, offsetBy: -i),
                                                upper: s1.index(s1.endIndex, offsetBy: -1)))
                
                return s1.substring(with:r) + s2.substring(to: index)
            }
            else {
                return "";
            }
        }
        i += 1
    }
    if evenNum {
        return s1 + s2
    }
    else {
        return s1 + s2.substring(from: s2.index(s2.startIndex, offsetBy: 1))
    }
}

func longestPalindrome2(_ s: String) -> String {
    let count = s.characters.count * 2
    var ps = s.substring(to: s.index(s.startIndex, offsetBy: 1))
    if s.characters.count == 1 {
        return s
    }
    for index in 2...count - 2 {
        let pos = index / 2
        
        if index % 2 == 0 {
            if pos <= (s.characters.count - 1) / 2 {
                let len = pos
                let posIndex = s.index(s.startIndex, offsetBy: pos)
                
                let s1 = s.substring(to: posIndex)
                let s2End = s.index(posIndex, offsetBy: len)
                let s2 = s.substring(with:Range(uncheckedBounds: (lower: posIndex, upper: s2End)))
                var aa = isPalindrome(s1, s2, true)
                if aa.characters.count > ps.characters.count {
                    ps = aa
                }
                
            }
            else {
                let len = s.characters.count - pos
                let posIndex = s.index(s.startIndex, offsetBy: pos)
                
                let s1End = s.index(posIndex, offsetBy: -len)
                let s1 = s.substring(with:Range(uncheckedBounds: (lower: s1End, upper: posIndex)))
                let s2 = s.substring(from: posIndex)
                //print(s1, s2)
                var aa = isPalindrome(s1, s2, true)
                if aa.characters.count > ps.characters.count {
                    ps = aa
                }
            }
        }
        else {
            if pos <= (s.characters.count - 1) / 2 {
                let len = pos
                let posIndex = s.index(s.startIndex, offsetBy: pos)
                let s1Start = s.index(posIndex, offsetBy: 1)
                let s1 = s.substring(to: s1Start)
                
                let s2End = s.index(posIndex, offsetBy: len + 1)
                let s2 = s.substring(with:Range(uncheckedBounds: (lower: posIndex, upper: s2End)))
                // print(s1, s2)
                var aa = isPalindrome(s1, s2, false)
                if aa.characters.count > ps.characters.count {
                    ps = aa
                }
                
            }
            else {
                let len = s.characters.count - pos
                let posIndex = s.index(s.startIndex, offsetBy: pos)
                
                let s1Start = s.index(posIndex, offsetBy: -(len - 1))
                let s1End = s.index(posIndex, offsetBy: 1)
                let s1 = s.substring(with:Range(uncheckedBounds: (lower: s1Start, upper: s1End)))
                let s2 = s.substring(from: posIndex)
                // print(s1, s2)
                var aa = isPalindrome(s1, s2, false)
                if aa.characters.count > ps.characters.count {
                    ps = aa
                }
            }
        }
    }
    return ps;
}


func testLongestPalindrome() -> Void {
    let s = "abba"
    print(longestPalindrome1(s))
    //print(s.characters.startIndex)
}
