//
//  HomeDatasourceController+Navbar.swift
//  twitter
//
//  Created by LeeChan on 4/6/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
    func setupNavigationBarItems() {
        setupRemainingItem()
        setupLeftNavItem()
        setupRightNavItems()
    }
    
    private func setupRemainingItem() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    private func setupLeftNavItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        
        let searchButton = UIButton(type: .system)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        
        let composeButton = UIButton(type: .system)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}
