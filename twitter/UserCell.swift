//
//  UserCell.swift
//  twitter
//
//  Created by LeeChan on 4/6/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            
            guard let user = datasourceItem as? User else {  return  }
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
            //            print(datasourceItem)
        }
    }
    
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mark Zuckerberg"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    let profileImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = #imageLiteral(resourceName: "zuckprofile")
        imgv.layer.cornerRadius = 5
        //        imgv.layer.masksToBounds = true
        imgv.clipsToBounds = true
        return imgv
    }()
    
    let usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@mzuckerberg"
        lbl.textColor = UIColor(r: 130, g: 130, b: 130)
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let bioTextView: UITextView = {
        let txtv = UITextView()
        txtv.text = "Welcome and join us to facebook where everyone is connected."
        txtv.font = UIFont.systemFont(ofSize: 15)
        txtv.backgroundColor = .clear
        return txtv
    }()
    
    let followButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = twitterBlue.cgColor
        btn.layer.borderWidth = 1
        btn.setTitle("follow", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(twitterBlue, for: .normal)
        btn.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -4)
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()

        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = separatorGray
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
}
