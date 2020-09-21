//
//  Tweet.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-09-21.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import Foundation


struct Tweet {
    let caption: String
    let tweetID: String
    var likes: Int
    var timestamp: Date!
    let retweetCount: Int
    let uid: String
    var user: User
//    var didLike = false
//    var replyingTo: String?
//
//    var isReply: Bool { return replyingTo != nil }
    
    init(user:User, tweetID: String, dictionary: [String: Any]) {
        self.tweetID = tweetID
        self.user = user
        self.uid = dictionary["uid"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0

        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
//
//        if let replyingTo = dictionary["replyingTo"] as? String {
//            self.replyingTo = replyingTo
//        }
    }
}