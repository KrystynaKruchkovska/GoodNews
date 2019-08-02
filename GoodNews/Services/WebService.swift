//
//  WebService.swift
//  GoodNews
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

struct Resource<T> {
    let url:URL
    let parse: (Data) -> T?
}


class WebService {
    
    func load<T>(_ resorse: Resource<T>, complition: @escaping(T?) -> Void ){
        
        URLSession.shared.dataTask(with: resorse.url) { (data, respons, error) in
            
            if let data = data {
                DispatchQueue.main.async {
                    complition(resorse.parse(data))
                }
            } else {
                complition(nil)
            }
            
        }.resume()
    }
}
