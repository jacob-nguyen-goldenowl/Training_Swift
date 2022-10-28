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
