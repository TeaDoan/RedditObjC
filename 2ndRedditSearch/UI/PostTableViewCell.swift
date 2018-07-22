//
//  PostTableViewCell.swift
//  2ndRedditSearch
//
//  Created by Thao Doan on 6/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post : KPDPost?
    
    {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var commentLbel: UILabel!
    @IBOutlet weak var postThumnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upsVoteLabel: UILabel!
    
    func updateView() {
        if let posts = post {
        titleLabel.text = posts.title
            let vote = posts.numberOfVotes ?? 0
            upsVoteLabel.text = "Likes: \(vote)"
            let comment = posts.numberOfComments ?? 0
            commentLbel.text = "Comments: \(comment)"
        guard let imageUrl = posts.thumnail else {return}
        KPDPostModelController.fetchPostImage(imageUrl) { (image) in
            if let images = image {
                DispatchQueue.main.async {
                self.postThumnail.image = images
                }
               
            }
        }
        
    }
}
}
