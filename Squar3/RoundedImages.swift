//
//  RoundedImages.swift
//  Squar3
//
//  Created by Ryan Cheng on 6/29/17.
//  Copyright © 2017 TechLab Education. All rights reserved.
//

import Foundation
import UIKit

private var _roundedImages = false
extension UIImageView {
    @IBInspectable var roundedImages: Bool {
        get {
            return _roundedImages
        } set {
            _roundedImages = newValue
            if _roundedImages == true {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = self.frame.height * 0.5
            }
        }
    }
}
