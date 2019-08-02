//
//  CategoryViewModel.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    var name: String
    var articles: [Article]
}


extension CategoryViewModel {
    
    func article(at index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article: article)
    }
    
}
