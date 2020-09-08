//
//  ExploreController.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-08-24.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit
class ExploreController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    
    func configureUI(){
          view.backgroundColor = .white

          navigationItem.title = "Explore"

      }
}
