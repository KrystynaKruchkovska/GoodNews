//
//  CategoryService.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

class CategoryServise {
    
    func getAllHeadlinesForAllCategories(complition: @escaping ([Category]) -> ()) {
        var categories = [Category]()
        var requestCount = 0
        let categoriesCount = Category.all().count
        
        Category.all().forEach { (category) in
            WebService().load(Article.by(category), complition: { articles in
                requestCount += 1
                
                guard let articles = articles else {
                    return
                }
                
                let category = Category(title: category, articles: articles)
                categories.append(category)
                
                if requestCount == categoriesCount {
                    DispatchQueue.main.async {
                        complition(categories)
                    }
                }
            })
        }
    }
}
