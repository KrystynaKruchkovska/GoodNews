//
//  CategoryListViewModel.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//


import UIKit

struct CategoryListViewModel {
    private (set) var categories: [Category]
}


extension CategoryListViewModel {
    
    var numberOfSections: Int {
        return categories.count
    }
    
    func numberOfRowsInSections (section: Int) -> Int {
        return self.categories[section].articles.count
    }
    
    func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return 60.0
    }
    
}

extension CategoryListViewModel {
    
    func categoryAtIndex(index: Int) -> CategoryViewModel {
        return CategoryViewModel(name: categories[index].title, articles: categories[index].articles)
    }
    
    func articleForSectionAtIndex(section: Int, index: Int) -> ArticleViewModel {
        return categoryAtIndex(index: section).article(at: index)
    }
}
