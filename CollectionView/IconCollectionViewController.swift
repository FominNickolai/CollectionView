//
//  IconCollectionViewController.swift
//  CollectionView
//
//  Created by Fomin Mykola on 8/2/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IconCollectionViewController: UICollectionViewController {
    
    private var iconSet: [Icon] = [
        Icon(name: "candle", price:3.99, isFeatured: false),
        Icon(name: "cat", price: 2.99, isFeatured: true),
        Icon(name: "dribbble", price: 1.99, isFeatured: false),
        Icon(name: "ghost", price: 4.99, isFeatured: false),
        Icon(name: "hat", price: 2.99, isFeatured: false),
        Icon(name: "owl", price: 5.99, isFeatured: true),
        Icon(name: "pot", price: 1.99, isFeatured: false),
        Icon(name: "pumkin", price: 0.99, isFeatured: false),
        Icon(name: "rip", price: 7.99, isFeatured: false),
        Icon(name: "skull", price: 8.99, isFeatured: false),
        Icon(name: "sky", price: 0.99, isFeatured: false),
        Icon(name: "toxic", price: 2.99, isFeatured: false),
        Icon(name: "ic_book", price: 2.99, isFeatured: false),
        Icon(name: "ic_backpack", price: 3.99, isFeatured: false),
        Icon(name: "ic_camera", price: 4.99, isFeatured: false),
        Icon(name: "ic_coffee", price: 3.99, isFeatured: true),
        Icon(name: "ic_glasses", price: 3.99, isFeatured: false),
        Icon(name: "ic_ice_cream", price: 4.99, isFeatured: false),
        Icon(name: "ic_smoking_pipe", price: 6.99, isFeatured: false),
        Icon(name: "ic_vespa", price: 9.99, isFeatured: false)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return iconSet.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
    
        // Configure the cell
        let icon = iconSet[indexPath.row]
        cell.iconImageView.image = UIImage(named: icon.name)
        cell.iconPriceLabel.text = "$\(icon.price)"
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
