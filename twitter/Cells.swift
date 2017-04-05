//
//  Cells.swift
//  twitter
//
//  Created by LeeChan on 4/5/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
    
}

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserCell: DatasourceCell {
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "TEST TEST TEST"
        lbl.backgroundColor = .green
        return lbl
    }()
    
    let profileImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.backgroundColor = .red
        return imgv
    }()
    
    let usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "username"
        lbl.backgroundColor = .purple
        return lbl
    }()
    
    let bioTextView: UITextView = {
        let textv = UITextView()
        textv.backgroundColor = .yellow
        return textv
    }()
    
    let followButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .cyan
        return btn
    }()
    
    override var datasourceItem: Any? {
        didSet {
//            nameLabel.text = datasourceItem as? String
        }
    }
    
    override func setupViews() {
        super.setupViews()
//        backgroundColor = .yellow
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
        
        
        
        
    }
}


