//
//  Game2.swift
//  Game
//
//  Created by Nguyễn Hữu Toàn on 31/10/2022.
//

import Foundation

public func Guess_Number() {
    
    print("Enter some number from 0 to 100:")
    
    var randomNumber = Int.random(in: 0 ... 100)
    var count: Int = 0
    
    while let input = readLine() {
        
        if !input.isEmpty && Int(input)! <= 100 {
            
            if input == "exit" {
                print("Bigo! You tried \(count) time. \n")
                break
            }
            
            if Int(input)! > randomNumber {
                print("Number guess is less than current number.\n")
                count += 1
            } else if Int(input)! < randomNumber {
                print("Number guess is lager than current number.\n")
                count += 1
            } else {
                
                print("Number guess is equal current number.\n")
                count += 1
                
                print("Bigo! You tried \(count) time. \n")
                
                randomNumber = Int.random(in: 0 ... 100)
                count = 0
                
            }
            
        } else {
            print("Number is not empty and must less than or equal 100.\n")
        }
        
        print("Enter some number from 0 to 100:")
        
    }
}

