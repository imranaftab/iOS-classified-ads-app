//
//  AdCell.swift
//  SellPhone
//
//  Created by Imran Aftab Rana on 22/11/2016.
//  Copyright © 2016 Imran Aftab Rana. All rights reserved.
//

import UIKit

class AdCell: UITableViewCell {

    @IBOutlet weak var adImg:UIImageView!
    @IBOutlet weak var adTitle:UILabel!
    @IBOutlet weak var adDesc:UILabel!
    @IBOutlet weak var adPrice:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(post: Post){
        adTitle.text = post.adTitle
        adDesc.text = post.adDesc
        adPrice.text = "$ \(post.adPrice)"
        adImg.image = PostsRepository.postsRepository.imageForPath(imagePath: post.adImgURL)
        
    }

}
