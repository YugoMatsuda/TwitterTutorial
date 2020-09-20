//
//  AuthService.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-09-20.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import  Firebase
struct AuthCredential {
    let email : String
    let password : String
    let fullName : String
    let userName : String
    let profileImage : UIImage


}



struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email:String, password:String,onSuccess: @escaping() -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult: AuthDataResult?, error: Error?) in
            guard error == nil else{
                return
            }
            onSuccess()
        }
    }
    
    func registerUser(credential:AuthCredential, completion:@escaping(Error?,DatabaseReference) -> Void){
        
        let email = credential.email
        let password = credential.password
        let fullName = credential.fullName
        let userName = credential.userName

        guard let imageData = credential.profileImage.jpegData(compressionQuality: 0.3) else { return  }
        let fileName = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else{ return }
               
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
    
                    guard let uid = result?.user.uid else { return}
                    
                    let values = ["email":email,
                                  "username": userName,
                                  "fullname":fullName,
                                  "profileImageUrl":profileImageUrl ]
                    
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                   
                }
            }
        }
    }
    
    
}
