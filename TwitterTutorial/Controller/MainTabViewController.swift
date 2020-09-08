//
//  MainTabViewController.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-08-24.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    
    
    let actionButton :UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("")
        configureViewController()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor ,  paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
    
        actionButton.layer.cornerRadius = 56/2
    }
    
    func configureViewController(){
        
        let feed  = FeedController()
        let nav1 = templateNav(image: UIImage(named: "home_unselected")!, rootViewController: feed)
        let explore = ExploreController()
        let nav2 = templateNav(image: UIImage(named: "search_unselected")!, rootViewController: explore)

        let notificatin = NotificationController()
        let nav3 = templateNav(image: UIImage(named: "like_unselected")!, rootViewController: notificatin)

        let conversations = ConversationsController()
        let nav4 = templateNav(image: UIImage(named: "ic_mail_outline_white_2x-1")!, rootViewController: conversations)

        viewControllers = [nav1,nav2,nav3,nav4]
        
    }
    
    func templateNav(image:UIImage,rootViewController:UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }

}
