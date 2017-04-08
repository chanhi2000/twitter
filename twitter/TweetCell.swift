//
//  TweetCell.swift
//  twitter
//
//  Created by LeeChan on 4/8/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = #imageLiteral(resourceName: "zuckprofile")
        imgv.layer.cornerRadius = 5
        //        imgv.layer.masksToBounds = true
        imgv.clipsToBounds = true
        return imgv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = separatorGray
        
        addSubview(profileImageView)
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        
    }
}
