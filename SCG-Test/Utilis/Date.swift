//
//  Date.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 23/05/23.
//

import UIKit

extension Date {
    static func formattedString(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMMM d, HH:mm"
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
}
