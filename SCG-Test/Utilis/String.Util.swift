//
//  string.Util.swift
//  WisdomTask
//
//  Created by  Keerthana G on 07/12/22.
//

import Foundation

extension String {
    var captalizeFirstLetter : String {
        return self.prefix(1).uppercased() + self.dropFirst()
        
    }
}

func randomString() -> String {
    let lower : UInt32 = 50
    let upper : UInt32 = 500
    let randomNumber = arc4random_uniform(upper - lower) + lower
    
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<randomNumber).map{ _ in letters.randomElement()! })
}
