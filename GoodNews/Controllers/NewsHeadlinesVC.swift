//
//  NewsHeadlinesVC.swift
//  GoodNews
//
//  Created by Mac on 5/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class NewsHeadlinesVC: UITableViewController {
    
    private var categoryListVM: CategoryListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateHeadlinesAndArticles()
        
    }
    
    private func populateHeadlinesAndArticles(){
        CategoryServise().getAllHeadlinesForAllCategories { [weak self] (categories) in
            self?.categoryListVM = CategoryListViewModel(categories: categories)
            self?.tableView.reloadData()
        }
    }
    
    private func setupUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.tableHeaderView = UIView.viewForTableViewHeader(subtitle: Date.dateAsStringForTAbleViewHeader())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsDetailsViewController"  {
            prepareSegueForNewsDetailsViewController(segue: segue)
        }
    }
    
    private func prepareSegueForNewsDetailsViewController(segue: UIStoryboardSegue) {
        
        guard let newsDetailsVc = segue  as? NewsDetailViewController else {
            fatalError(" fatalError destination was not found!")
        }
        guard let indexPath = self.tableView.indexPathsForSelectedRows else {
            fatalError("index path throws error")
        }
        
    }
    

    
    
}


extension NewsHeadlinesVC {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeadLineCell", for: indexPath) as? HeadLineCell else {
            fatalError("HeadLineCell not found")
        }
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).article(at: indexPath.item)
        cell.configure(vm: articleVM)
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSections(section: section)
    }
}

extension NewsHeadlinesVC {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title: name)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return categoryListVM.heightForHeaderInSection(section)
    }
}
