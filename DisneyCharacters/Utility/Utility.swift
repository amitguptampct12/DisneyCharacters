//
//  Utility.swift
//  DogFacts
//
//  Created by Amit Gupta on 15/12/24.
//
import Foundation
/* String extension for getting a human redable Date. */

class Utility {
    
  
}
/* String extension for getting formatted date.*/
    extension String
    {
        func formatDate() -> String {
            let dateFormatterGet = DateFormatter()
            /* date formate coming from API */
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let dateObj: Date? = dateFormatterGet.date(from: self)
            return dateFormatter.string(from: dateObj!)
        }
    }
    /* Generic Array extention to check if Array contains particular index or not. */
    extension Array {
        
        func checkOutIndex(index: Int)-> Bool {
            if index < 0 || index >= self.count{
                return false
            }else {
                return true
            }
        }
        
    }
