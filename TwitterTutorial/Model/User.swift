//
//  User.swift
//  TwitterTutorial
//
//  Created by Stephen Dowless on 1/27/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import Foundation
import Firebase

struct User {
    var fullname: String
    let email: String
    var username: String
    var profileImageUrl: URL?
    let uid: String
  
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid  == uid}
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""

        
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}



