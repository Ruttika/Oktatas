//
//  TextDecoder.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2019. 11. 06..
//  Copyright © 2019. Rudolf Dani. All rights reserved.
//

import Foundation

class TextDecoder {
    
    
    func hexToStr(text: String) -> String {
        
        let regex = try! NSRegularExpression(pattern: "(0x)?([0-9A-Fa-f]{2})", options: .caseInsensitive)
        let textNS = text as NSString
        let matchesArray = regex.matches(in: textNS as String, options: [], range: NSMakeRange(0, textNS.length))
        let characters = matchesArray.map {
            Character(UnicodeScalar(UInt32(textNS.substring(with: $0.range(at: 2)), radix: 16)!)!)
        }
        
        return String(characters)
    }
    
    
}
