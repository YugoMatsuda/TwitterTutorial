//
//  LoginController.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-09-08.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    private let logoImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        // Do any additional setup after loading the view.
    }
    
    
    func configureUi(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)

    }
  
}
