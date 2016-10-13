//
//  PhotoCell.swift
//  InstagramFeed
//
//  Created by Nguyen Nam Long on 10/13/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var titleName: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell (dataCell: InstaModel) {
        avatarImage.setImageWith(URL(string: dataCell.avatarURL!)!)
        titleName.text = dataCell.fullName
        statusImage.setImageWith(URL(string: dataCell.imageLowURL!)!)
    }

}
