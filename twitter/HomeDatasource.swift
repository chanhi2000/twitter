//
//  HomeDatasource.swift
//  twitter
//
//  Created by LeeChan on 4/5/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let user1 = User(name: "test1", username: "@test1", bioText: "MORE BIO TEXTS1 MORE BIO TEXTS1 MORE BIO TEXTS1 MORE BIO TEXTS1", profileImage: #imageLiteral(resourceName: "zuckprofile"))
        let user2 = User(name: "test2", username: "@test2", bioText: "MORE BIO TEXTS2 MORE BIO TEXTS2 MORE BIO TEXTS2 MORE BIO TEXTS2 MORE BIO TEXTS2 MORE BIO TEXTS2 MORE BIO TEXTS2 MORE BIO TEXTS2", profileImage: #imageLiteral(resourceName: "wanderprofile"))
        
        let user3 = User(name: "test3", username: "@test3", bioText: "MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3 MORE BIO TEXTS3", profileImage: #imageLiteral(resourceName: "wanderprofile"))
        
        return [user1, user2, user3]
    }()
    
    let tweets: [Tweet] = {
        let user1 = User(name: "test1", username: "@test1", bioText: "SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT", profileImage: #imageLiteral(resourceName: "zuckprofile"))
        let tweet1 = Tweet(user: user1, message: "SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT")
        let tweet2 = Tweet(user: user1, message: "EXCITING NEWS: MORE BIO TEXT MORE BIO TEXT vvv EXCITING NEWS: MORE BIO TEXT MORE BIO TEXT vvv EXCITING NEWS: MORE BIO TEXT MORE BIO TEXT")
        return [tweet1, tweet2]
    }()
    
    
//    let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        return users.count
        
    }
    
    
}

