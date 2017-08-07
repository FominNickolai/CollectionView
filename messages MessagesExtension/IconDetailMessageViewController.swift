//
//  IconDetailMessageViewController.swift
//  messages MessagesExtension
//
//  Created by Fomin Mykola on 8/7/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit
import IconDataKit

class IconDetailMessageViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = icon?.name
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = icon?.description
        }
    }
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.image = UIImage(named: icon?.imageName ?? "")
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            if let icon = icon {
                priceLabel.text = "$\(icon.price)"
            }
        }
    }
    
    var icon: Icon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
