//
//  Cells.swift
//  twitter
//
//  Created by LeeChan on 4/5/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SHOW ME MORE"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = twitterBlue
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = separatorGray
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        addSubview(whiteBackgroundView)
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
}

class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "WHO TO FOLLOW"
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = separatorGray
        
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}


