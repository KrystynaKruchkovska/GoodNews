//
//  UIImage+Extensions.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func imageForPlaceHolder() -> UIImage {
        return UIImage(named: "placeholder")!
    }
    
    static func imageForHeadLine(url: String, complition: @escaping(UIImage) -> ()) {
        
        guard let imageUrl = URL(string: url) else {
            complition(UIImage.imageForPlaceHolder())
            return
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageUrl) {
                if let downloadedImage = UIImage(data: data){
                    complition(downloadedImage)
                }
            }
        }
    }
}
