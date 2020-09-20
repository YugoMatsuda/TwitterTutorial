//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-09-20.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import Foundation

struct UserService{
    
    static let shared = UserService()
    
    func fetchUser(){
        print("fetchUser")
    }

}
