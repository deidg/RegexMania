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
    case password
    case website
    }
    
    enum Regex: String {
        case age = "[0-9]{2,2}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[a-zA-Z]{2,64 }"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[a-zA-z\\d!$@$!%*?&#]{6,25}"
        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?" // any site url
        //        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.(org|com)(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?" // any site url with .com or .org and subpages
        //        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.(org|com)" // any site url with .com or .org and NO subpages
        //        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.org" // any site url with only .org and NO subpages
    }
    
    func isValid(_ ValidityType: ValityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch ValidityType {
        case .age:
            regex = Regex.age.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        case .website:
            regex = Regex.website.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    
    
}
