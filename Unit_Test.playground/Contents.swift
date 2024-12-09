import UIKit

/*  UNIT TEST 1 */
/* 
 Input: Int number
 Output: List of divisors
 
 Check: 
 //1
 Input: 0
 Output: nil
 //2
 Input: 1
 Output: [1]
 */

func printListDivisor(number: Int) -> [Int]? {
    
    var list: [Int] = []
    
    if number < 1 {
        return nil
    }
    
    for i in 1 ... number {
        if number % i == 0 {
            list.append(i)
        }
    }
    return list
}

//printListDivisor(number: 26)
//printListDivisor(number: 1)
//printListDivisor(number: 0)


/* UNIT TEST 2 */

/*
 
 Input: Two array.
 Output: List of numbers common in two arrays.
 
 Check: 
 Input: Empty array
 Output: nil
 
 */

    // Method 1
func mergeArr1<T>(arr1: [T], arr2: [T]) -> Set<T> {
    
    if arr1.isEmpty, arr2.isEmpty {
        return []
    }
    
    var newSet: Set<T> = []
    
    let commonNumber = arr1.filter { x in 
        arr2.contains(x)
    }
    newSet = Set(commonNumber)
    
    return newSet
    
}

    // Method 2
func mergeArr2<T>(arr1: [T], arr2: [T]) -> Set<T> {
    
    if arr1.isEmpty, arr2.isEmpty {
        return []
    }
    
    var newArray: [T] = []
    var newSet: Set<T> = []
    for i in arr1 {
        for j in arr2 {
            if i == j {
                newArray.append(i)
            }
        }
    }
    newSet = Set(newArray)
    return newSet
}

var a = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55]
var b = [1, 2,1,3,3, 3, 4, 5, 6, 10, 7, 8, 9, 11, 12, 13]

var merge1 = mergeArr1(arr1: a, arr2: b)
var merge2 = mergeArr2(arr1: a, arr2: b)

print(merge1)
print(merge2)
