//
//  NewsDetailsViewModel.swift
//  GoodNews
//
//  Created by Mac on 7/7/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import Foundation

struct NewsDetailsViewModel {
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
}

extension NewsDetailsViewModel {
    var sourceNew: String {
        return self.article.sourseName
    }
    
    var url: String? {
        return article.url
    }
}
