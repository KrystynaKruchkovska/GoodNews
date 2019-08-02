//
//  ThemeManager.swift
//  GoodNews
//
//  Created by Mac on 5/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class ThemeManager {
    
    static func setUp(){
        UINavigationBar.appearance().barTintColor = .purple
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
