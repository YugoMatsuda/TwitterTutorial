//
//  FedController.swift
//  TwitterTutorial
//
//  Created by Yugo Matsuda on 2020-08-24.
//  Copyright © 2020 Yugo Matsuda. All rights reserved.
//

import UIKit
import SDWebImage

 let reuseIdentifier = "TweetCell"

class FeedController: UICollectionViewController{
    
    
    private var tweets = [Tweet](){
        didSet {self.collectionView.reloadData()}
    }
    
    var user: User?{
        didSet{
            print("didsetFeed \(user)")
            configureLeftBarButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchTweet()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func fetchTweet(){
        TweetService.shared.fetchTweets { (tweets) in
            print("Debug Tweet is \(tweets)")
            self.tweets = tweets
        }
    }
    
    
    func configureUI(){
        view.backgroundColor = .white
        collectionView.backgroundColor = .white

        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        
        cell.delegate = self
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = TweetController(tweet: tweets[indexPath.row])
//        navigationController?.pushViewController(controller, animated: true)
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let viewModel = TweetViewModel(tweet: tweets[indexPath.row])
//        let height = viewModel.size(forWidth: view.frame.width).height
        return CGSize(width: view.frame.width, height:  100)
    }
}

extension FeedController: TweetCellDelegate {
    func handleProfileImageTapped(_ cell: TweetCell) {
        guard let user  = cell.tweet?.user else{ return }
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func handleReplyTapped(_ cell: TweetCell) {
        
    }
    
    func handleLikeTapped(_ cell: TweetCell) {
        
    }
    
    func handleFetchUser(withUsername username: String) {
        
    }
    

}

