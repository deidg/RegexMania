//
//  Extensions.swift
//  RegexMania
//
//  Created by Alex Nagy on 12/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation

// more info here https://emailregex.com/regular-expressions-cheat-sheet/


extension String {
    
    enum ValityType {     // в этом энаме будут валидироваться разные типы дапнных
    case age
    case email
    }
    
    enum Regex: String {
        case age = "[0-9]{2,2}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[a-zA-Z]{2,64}"   
        
    }
    
    func isValid(_ ValidityType: ValityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch ValidityType {
        case .age:
            regex = Regex.age.rawValue
        case .email:
            regex = Regex.email.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    
    
}
