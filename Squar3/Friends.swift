//
//  Friends.swift
//  Squar3
//
//  Created by Ryan Cheng on 6/29/17.
//  Copyright © 2017 TechLab Education. All rights reserved.
//

import Foundation

class friends {
    private var _friendUsername: String!
    private var _friendName: String!
    private var _friendUID: String!
    private var _friendImage: String!
    
    var friendUsername: String {
        return _friendUsername
    }
    var friendName: String {
        return _friendName
    }
    var friendUID: String {
        return _friendUID
    }
    var friendImage: String {
        return _friendImage
    }
    
    init(dictionary: Dictionary<String, AnyObject>) {
        if let name = dictionary["name"] {
            _friendName = name as! String
        }
        if let username = dictionary["username"] {
            _friendUsername = username as! String
        }
        if let uid = dictionary["friendUID"] {
            _friendUID = uid as! String
        }
        if let image = dictionary["image"] {
            _friendImage = image as! String
        }
    }
}
