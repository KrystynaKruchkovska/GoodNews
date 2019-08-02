//
//  Category.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

struct Category {
    let title: String
    let articles:[Article]
    
    static func all() -> [String]{
        return ["Bissnes", "Entertainment", "General", "Sports"]
    }
}
