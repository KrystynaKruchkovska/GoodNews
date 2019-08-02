//
//  HeadLineCell.swift
//  GoodNews
//
//  Created by Mac on 5/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class HeadLineCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var headLineImageView: UIImageView!
}

extension HeadLineCell {
    func configure(vm: ArticleViewModel) {
        self.titleLable.text = vm.title
        self.descriptionLabel.text = vm.description
        vm.image { (image) in
            self.headLineImageView.image = image
        }
    }
}
