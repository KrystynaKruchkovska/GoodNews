//
//  UIView+Extensions.swift
//  GoodNews
//
//  Created by Mac on 7/6/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import UIKit

extension UIView {
    
    static func viewForTableViewHeader(subtitle: String) -> UIView {
        let screenRect = UIScreen.main.bounds
        let subTitleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenRect.size.width, height: 44)))
        let subtitleLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: screenRect.size.width, height: 44)))
        subtitleLabel.text = subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = UIColor.gray
        subTitleView.addSubview(subtitleLabel)
        return subTitleView
    }
    
    static func viewForSectionHeader(title:String) -> UIView {
         let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(origin:CGPoint(x: 15, y: 0), size: CGSize(width: screenRect.size.width, height: 60)))
        headerView.backgroundColor = .white
        
        let sectionHeaderLabel = UILabel(frame: headerView.frame)
        sectionHeaderLabel.text = title.uppercased()
        sectionHeaderLabel.textColor = .black
        sectionHeaderLabel.font = UIFont.fontForSectionHeaderTitle()
        headerView.addSubview(sectionHeaderLabel)
        
        return headerView
    }
}
