//
//  Utility.swift
//  DogFacts
//
//  Created by Amit Gupta on 15/12/24.
//
import Foundation
/* String extension for getting a human redable Date. */
extension String
{
    func formatDate() -> String {
        let dateFormatterGet = DateFormatter()
        /* date formate coming from API */
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let dateObj: Date? = dateFormatterGet.date(from: self)
        
        return dateFormatter.string(from: dateObj!)
    }
}
