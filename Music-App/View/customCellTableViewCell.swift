//
//  customCellTableViewCell.swift
//  Music-App
//
//  Created by Appnap WS01 on 16/9/20.
//  Copyright © 2020 Appnap WS01. All rights reserved.
//

import UIKit

class customCellTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
