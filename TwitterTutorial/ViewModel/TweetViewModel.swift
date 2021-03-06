//
//  TweetViewModel.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-09-21.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit

struct TweetViewModel {
    
    // MARK: - Properties
    
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        return user.profileImageUrl
    }
    
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "2m"
    }
    // MARK: - Lifecycle
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname,
                                              attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        title.append(NSAttributedString(string: " @\(user.username)",
            attributes: [.font: UIFont.systemFont(ofSize: 14),
                         .foregroundColor: UIColor.lightGray]))
        
        title.append(NSAttributedString(string: " · \(timestamp)",
        attributes: [.font: UIFont.systemFont(ofSize: 14),
                     .foregroundColor: UIColor.lightGray]))
        return title
    }

    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
    
    
}
