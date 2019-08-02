//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import UIKit

struct ArticleViewModel {
    private(set) var article: Article
    
    init(article:Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    
    var description: String? {
        return self.article.description
    }
    
    func image(completion: @escaping(UIImage?) -> ()){
        guard let imageURL = article.imageUrl else {
            completion(nil)
            return
        }
        UIImage.imageForHeadLine(url: imageURL) { (image) in
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
