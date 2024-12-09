//
//  Game1.swift
//  Game
//
//  Created by Nguyễn Hữu Toàn on 28/10/2022.
//

import Foundation

public func Rock_paper_scissors_game() {
    
    print("Welcome Rock, Paper and Scissors \nPress 'exit' to stop game \nStart.")
    
    print("Please choose rock, paper or scissors: ")
    
    var count: Int = 0
    
    while let input = readLine() {
        
        let sign = ["rock", "paper", "scissors"]
        
        let newInput = String(input.lowercased())
        
        if newInput == "exit" {
            print("Score: \(count)")
            break
        }
        
        if input.isEmpty {
            print("Please enter choose!")
        }
        
        if let randomElement = sign.randomElement() {
            print(randomElement)
            if newInput == randomElement {
                count += 1
                print("Bigo! answer is correct")
            } else {
                print("Sorry! choose is incorrect. Please re-enter choose")
            }
        }
        
        print("Please choose rock, paper or scissors: ")
        
    }
    
}


