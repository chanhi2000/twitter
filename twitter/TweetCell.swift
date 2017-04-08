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
        txtv.backgroundColor = .clear
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
    
    let replyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let retweetButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let dmButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
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

        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        
        let replyButtonContainerView = UIView()
        
        let retweetButtonContainerView = UIView()
        
        let likeButtonContainerView = UIView()
        
        let dmButtonContainerView = UIView()
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, dmButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(dmButton)
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        dmButton.anchor(dmButtonContainerView.topAnchor, left: dmButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
}
