//
//  HomeDatasource.swift
//  twitter
//
//  Created by LeeChan on 4/5/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        print("READY to parse json: \n", json)
        
        var users = [User]()
        
        let array = json["users"].array
        for userJSON in array! {
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }

    
    let tweets: [Tweet] = {
        let user1 = User(name: "test1", username: "@test1", bioText: "SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT", profileImage: #imageLiteral(resourceName: "zuckprofile"))
        let tweet1 = Tweet(user: user1, message: "SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv SOME BIO TEXT MORE BIO TEXT SOME BIO TEXT MORE BIO TEXT vvv")
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

