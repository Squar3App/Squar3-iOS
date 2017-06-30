
//
//  DummyLaunchScreen.swift
//  Squar3
//
//  Created by Ryan Cheng on 6/29/17.
//  Copyright © 2017 TechLab Education. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DummyLaunchScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if userUIDConstant != nil {
            let reference = Database.database().reference()
            reference.child("Users").child(userUIDConstant!).observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                    if let username = dictionary["username"] {
                        usernameConstant = username as! String
                    }
                    if let nameValue = dictionary["name"] {
                        nameConstant = nameValue as! String
                    }
                }
            
            })
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
