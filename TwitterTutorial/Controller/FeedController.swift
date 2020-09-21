//
//  FedController.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-08-24.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit
import SDWebImage
class FeedController: UIViewController{
    
    
    var user: User?{
        didSet{
            print("didsetFeed \(user)")
            configureLeftBarButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    
    func configureUI(){
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView

    }
    
    func configureLeftBarButton(){
        guard let user = user else { return  }
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32/2
        profileImageView.layer.masksToBounds = true
        guard let profileImageUrl = user.profileImageUrl else { return}
        profileImageView.sd_setImage(with: profileImageUrl, completed: nil)
        navigationItem.leftBarButtonItem  = UIBarButtonItem(customView: profileImageView)
    }
    
}
