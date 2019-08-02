//
//  Data+Extensions.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateAsStringForTAbleViewHeader() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: Date())
        
    }
}
