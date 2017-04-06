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
    
//    let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}

