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
            reference.child("Users").child(userUIDConstant!).child("name").observeSingleEvent(of: .value, with: { (snapshot) in
                if let name = snapshot.value as? String {
                    nameConstant = name
                    print(userUIDConstant!)
                    self.performSegue(withIdentifier: "DummySplashScreen", sender: nil)
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
