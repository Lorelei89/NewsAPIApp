//
//  ArticleCell.swift
//  NewsAPIApp
//
//  Created by Sabina Buruiana on 1/25/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

  
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleSubtitle: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
