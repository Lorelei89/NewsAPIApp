//
//  ViewController.swift
//  NewsAPIApp
//
//  Created by Sabina Buruiana on 1/25/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let client = ArticleNetworkServices()
    let parser = ArticleParser()
    var articles = [Article]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchArticles { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    func fetchArticles(_ completion: @escaping () -> Void){
        client.fetchArticles { [unowned self] data in
            if let articlesParsed = self.parser.articles(with: data) {
                self.articles = articlesParsed
                print(self.articles)
            }
            //daca esti inc ompletion block si nu faci asta nu primesti jsonul
            
            completion()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        cell.articleTitle.text = self.articles[indexPath.row].headline
        cell.articleSubtitle.text = self.articles[indexPath.row].desc
        cell.articleAuthor.text = self.articles[indexPath.row].author
        cell.articleImage.image = UIImage(named: self.articles[indexPath.row].imageUrl!)
        
        return cell
    }


}

