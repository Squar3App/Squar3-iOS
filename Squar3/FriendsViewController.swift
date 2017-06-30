//
//  FriendsViewController.swift
//  Squar3
//
//  Created by Ryan Cheng on 6/29/17.
//  Copyright © 2017 TechLab Education. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class FriendsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var friendArray = [friends]()
    let reference = Database.database().reference()
    var storage: Storage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = Storage.storage()
        collectionView.dataSource = self
        collectionView.delegate = self
        downloadData()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "Friends Cell", for: indexPath) as? FriendCollectionViewCell {
            let friendValue = friendArray[indexPath.row]
            cell.configureCell(friend: friendValue)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func downloadData() {
        reference.child("Users").child(userUIDConstant!).child("Friends").observeSingleEvent(of: .value, with: { (snapshot) in
            self.friendArray.removeAll()
            
            if let snap = snapshot.children.allObjects as? [DataSnapshot] {
            print(snapshot.children.allObjects.count)
                for friend in snap {
                    
                    if let friendValue = friend.value as? Dictionary<String, AnyObject> {
                        let friendObject = friends(dictionary: friendValue)
                        self.friendArray.append(friendObject)
                    }
                }
            }
            self.collectionView.reloadData()
        })
    }
    
    @IBAction func addFriendsButtonClicked(_ sender: Any) {
        let fileData = UIImageJPEGRepresentation(UIImage(named: "Default Profile")!, 1.0)!
        let storageRef = storage.reference().child(userUIDConstant!).child("profilePhoto")
        storageRef.putData(fileData).observe(.success) { (snapshot) in
            // When the image has successfully uploaded, we get it's download URL
            let downloadURL = snapshot.metadata?.downloadURL()?.absoluteString
            // Write the download URL to the Realtime Database
            let dictionary = ["image":downloadURL, "name":"Ryanryan", "friendUID": userUIDConstant!, "username": "ryry22"]
            self.reference.child("Users").child(userUIDConstant!).child("Friends").childByAutoId().setValue(dictionary) { (error, database) in
                self.downloadData()
            }
        }
    }
}
