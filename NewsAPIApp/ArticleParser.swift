//
//  ArticleParser.swift
//  NewsAPIApp
//
//  Created by Sabina Buruiana on 1/25/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class ArticleParser {
    func jsonDictionary(with data:Data?) -> JSONDictionary? {
        do {
            if let data = data,
                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary {
                    return jsonDict
            }
        } catch {
            print("Couldn't parse the json.Error: \(error)")
        }
        return nil
    }
    
    func articles(with data: Data?) -> [Article]? {
        //verifica daca dictionarul ala jsonDict e venit de la server
        guard let dict = jsonDictionary(with: data) else {
            print("Error: couldn't parse dictionary from data")
            return nil
        }
        
        guard let articlesDict = dict["articles"] as? [JSONDictionary] else {
            print("Error: couldn't parse items from JSON: \(dict)")
            return nil
        }
        //facem map aicia cu dictionarele
        return articlesDict.flatMap { article(with: $0) }
    }
    
    func article(with dict:JSONDictionary) -> Article? {
        if let headline = dict["title"] as? String,
            let desc = dict["description"] as? String,
            let author = dict["author"] as? String,
            let url = dict["url"] as? String,
            let imageUrl = dict["urlToImage"] as? String
        {
            let article = Article(headline:headline, desc:desc, author:author, url:url, imageUrl:imageUrl)
            return article
            
        } else {
            print("Error: couldn't parse JSON dictionary: \(dict)")
        }
        return nil

    }
    
    
}
