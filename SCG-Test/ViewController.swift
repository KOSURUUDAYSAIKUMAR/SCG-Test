//
//  ViewController.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var array = [1, 3, 5, 7, 9]
        let middleIndex =  findMiddleIndex(array) ?? 0 // sumLeftRightElements(numberArray: [1, 3, 5, 7, 9])
        print(array[middleIndex])
        // Do any additional setup after loading the view.
    }

    func findMiddleIndex(_ array: [Int]) -> Int? {
        let totalCount = array.count
        // Special case: Empty array
        if totalCount == 0 {
            return nil
        }
        // Special case: Single element array
        if totalCount == 1 {
            return 0
        }
        var leftSum = 0
        var rightSum = array[1..<totalCount].reduce(0, +)
        print("right sum ----", rightSum)
        for index in 0..<totalCount {
            if leftSum == rightSum {
                return index
            }
            if index < totalCount - 1 {
                leftSum += array[index]
                rightSum -= array[index + 1]
            }
        }
        return nil
    }
    
    func isPalindrome(_ input: String) -> Bool {
        let characters = Array(input.lowercased())
        let count = characters.count
        let midIndex = count / 2
        
        for i in 0..<midIndex {
            if characters[i] != characters[count - 1 - i] {
                return false
            }
        }
        
        return true
    }
}

