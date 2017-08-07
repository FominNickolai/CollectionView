//
//  IconCollectionViewController.swift
//  CollectionView
//
//  Created by Fomin Mykola on 8/2/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit
import Social
import IconDataKit

private let reuseIdentifier = "Cell"

class IconCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    private var iconSet: [Icon] = IconData.iconSet
    
    private var shareEnabled = false
    private var selectedIcons: [Icon] = []

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
        cell.iconImageView.image = UIImage(named: icon.imageName)
        cell.iconPriceLabel.text = "$\(icon.price)"
        cell.backgroundView = icon.isFeatured ? UIImageView(image: UIImage(named: "feature-bg")) : nil
        cell.selectedBackgroundView = UIImageView(image: UIImage(named: "icon-selected"))
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Check if the sharing mode is enabled, otherwise, just leave this method
        guard shareEnabled else { return }
        //Determine the selected items by using the indexPath
        let selectedIcon = iconSet[indexPath.row]
        //Add the selected item into the array
        selectedIcons.append(selectedIcon)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //Check if the sharing mode is enabled, otherwise, just leave this method
        guard shareEnabled else { return }
        let deSelectedIcon = iconSet[indexPath.row]
        //Find the index of the deselected icon. Here we use the index method and pass it a closure. In the closure, we compare the name of the deselected icon with all the items in the selected icons array. If we find a match, the index method will return us the index for later removal.
        if let index = selectedIcons.index(where: { $0.name == deSelectedIcon.name }) {
            selectedIcons.remove(at: index)
        }
    }

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
    
    //MARK: - Actions
    @IBAction func shareButtonTapped(sender: UIBarButtonItem) {
        if shareEnabled {
            //Post selected photos to Facebook
            if selectedIcons.count > 0 {
                if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                    let tweetComposer = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    tweetComposer?.setInitialText("Love these icons! I am planning to purchase all of them.")
                    for icon in selectedIcons {
                        tweetComposer?.add(UIImage(named: icon.imageName))
                    }
                    present(tweetComposer!, animated: true, completion: nil)
                }
            }
            //Deselect all selected items
            if let indexPaths = collectionView?.indexPathsForSelectedItems {
                for indexPath in indexPaths {
                    collectionView?.deselectItem(at: indexPath, animated: false)
                }
            }
            //Remove all items from selectedIcons array
            selectedIcons.removeAll(keepingCapacity: true)
            
            //Change the sharing mode to NO
            shareEnabled = false
            collectionView?.allowsMultipleSelection = false
            shareButton.title = "Share"
            shareButton.style = UIBarButtonItemStyle.plain
        } else {
            //Change shareEnabled to YES and change the button text to Upload
            shareEnabled = true
            collectionView?.allowsMultipleSelection = true
            shareButton.title = "Done"
            shareButton.style = UIBarButtonItemStyle.done
        }
    }
    
    //MARK: - Segues
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showIconDetail" {
            if shareEnabled {
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIconDetail" {
            if let indexPaths = collectionView?.indexPathsForSelectedItems {
                let destinationController = segue.destination as! IconDetailViewController
                destinationController.icon = iconSet[indexPaths[0].row]
                collectionView?.deselectItem(at: indexPaths[0], animated: true)
            }
        }
    }

}





















