//
//  NewsDetailViewController.swift
//  GoodNews
//
//  Created by Mac on 7/7/19.
//  Copyright © 2019 CO.KrystynaKruchkovska. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    private var newsDetailsVM: NewsDetailsViewModel!
    var article: Article!

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension NewsDetailViewController {
    
    func setupUI() {
        
        let newsDetailsViewModel = NewsDetailsViewModel(article: article)
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.title = article.sourseName
        
        guard let url = newsDetailsViewModel.url,
            let newsDetailURL = URL(string: url) else {
                fatalError("url is not found")
        }
        let request = URLRequest(url: newsDetailURL)
        self.webView.load(request)
    }
}


