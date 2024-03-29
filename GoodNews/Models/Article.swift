//
//  Article.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

struct NewsSoursesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    
    let title: String?
    let description: String?
    let url: String?
    let imageUrl: String?
    let sourseName: String
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case description
        case url
        case imageUrl = "urlToImage"
        case source
    }
    
    private enum SourseKeys: String, CodingKey {
        case name
    
    }
    
    init(for decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.url = try? container.decode(String.self, forKey: .url)
        self.imageUrl = try? container.decode(String.self, forKey: .imageUrl)
        let sourceContainer = try container.nestedContainer(keyedBy: SourseKeys.self, forKey: .source)
        self.sourseName = try sourceContainer.decode(String.self, forKey: .name)
        
    }
    
}

extension Article {
    
    static func by(_ category: String) -> Resource<[Article]> {
        return Resource<[Article]>(url: URL.urlForTopHeadlines(for: category)) { data in
            return try! JSONDecoder().decode(NewsSoursesResponse.self, from: data).articles
        }
    }
    
}



