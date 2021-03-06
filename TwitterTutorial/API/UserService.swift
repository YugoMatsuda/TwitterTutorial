//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-09-20.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import Firebase

struct UserService{
    
    static let shared = UserService()
    
    func fetchUser(uid:String, completion: @escaping(User) -> Void){
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String:AnyObject] else { return  }
            let user = User(uid: uid, dictionary: dictionary)
            print("Debug \(user)")
            completion(user)

        }
    }
    

}
