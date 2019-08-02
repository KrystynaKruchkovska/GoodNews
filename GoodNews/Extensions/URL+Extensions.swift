//
//  URL+Extensions.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForTopHeadlines(for category: String) -> URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?category=\(category)&apiKey=6539ec93952e496db236d97a0706c334")!
    }
    
}
