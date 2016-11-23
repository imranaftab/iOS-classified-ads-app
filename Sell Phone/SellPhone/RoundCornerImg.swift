//
//  RoundCornerImg.swift
//  SellPhone
//
//  Created by Imran Aftab Rana on 22/11/2016.
//  Copyright © 2016 Imran Aftab Rana. All rights reserved.
//

import UIKit

class RoundCornerImg: UIImageView {
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
