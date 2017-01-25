//
//  ArticleNetworkServices.swift
//  NewsAPIApp
//
//  Created by Sabina Buruiana on 1/25/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
class ArticleNetworkServices {
    func fetchArticles(_ completion:@escaping(Data?) -> Void) {
        let urlString = "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=f5f742185cca4f29be69d79a56cb9343"
        guard let url = URL(string: urlString) else {
            print("Error: couldn't create URL from string")
            completion(nil)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Error fetching repositories: \(error)")
                completion(data)
                return
            }
            
            completion(data)
        })
        task.resume()
        
    }
}
