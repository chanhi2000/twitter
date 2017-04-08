//
//  TweetCell.swift
//  twitter
//
//  Created by LeeChan on 4/8/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else {  return  }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = " \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            let parargraphStyle = NSMutableParagraphStyle()
            parargraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: parargraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            
            
            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
        let txtv = UITextView()
        txtv.text = "SOME SAMPLE TEXT"
        txtv.backgroundColor = .yellow
        return txtv
    }()
    
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
        addSubview(messageTextView)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
}
