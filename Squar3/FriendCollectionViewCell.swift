//
//  FriendCollectionViewCell.swift
//  Squar3
//
//  Created by Ryan Cheng on 6/29/17.
//  Copyright © 2017 TechLab Education. All rights reserved.
//

import UIKit
import FirebaseStorage

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    
    let storage = Storage.storage()
    var reference: StorageReference!
    
    func configureCell(friend: friends) {
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor(red: 255/255, green: 159/255, blue: 149/255, alpha: 1).cgColor
        image.clipsToBounds = true
        username.text = friend.friendUsername
        name.text = friend.friendName
        downloadImage(url: friend.friendImage)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func downloadImage(url: String) {
        let storageRef = storage.reference(forURL: url)
        // Download the data, assuming a max size of 1MB (you can change this as necessary)
        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            // Create a UIImage, add it to the array
            if error == nil {
                self.image.image = UIImage(data: data!)
            }
            else {
                print(error)
            }
        }
    }
    
}
