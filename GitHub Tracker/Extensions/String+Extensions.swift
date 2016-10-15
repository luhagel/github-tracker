//
//  String+Extensions.swift
//  GitHub Tracker
//
//  Created by Jake on 10/14/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation

extension String {
    
    mutating func removeLastCharacters(numberOfCharacters: Int) {
        let startIndex = str.index(str.startIndex, offsetBy: characters.count-numberOfCharacters)
        let endIndex = str.index(str.startIndex, offsetBy: characters.count-1)
        let range = startIndex...endIndex
        removeSubrange(range)
    }
    
}
