//
//  IconTableViewCell.swift
//  messages MessagesExtension
//
//  Created by Fomin Mykola on 8/7/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit

class IconTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priveLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
