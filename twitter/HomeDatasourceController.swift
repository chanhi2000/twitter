//
//  HomeDatasourceController.swift
//  twitter
//
//  Created by LeeChan on 4/5/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    // layout for horizontal orientation
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBarItems()
        
//        self.datasource = HomeDatasource()
        
        fetchHomefeed()
        
    }
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com/")
    
    class Home: JSONDecodable {
        
        let users: [User]
        
        required init(json: JSON) throws {
//            print("READY to parse json: \n", json)
            
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
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    fileprivate func fetchHomefeed() {
        // JSON Fetch starts here: TRON way
        let request: APIRequest<HomeDatasource,JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print("successfully fetched the json objects")
            
            print(homeDatasource.users.count)
            self.datasource = homeDatasource
            
        }) { (error) in
            print("failure to fetch json", error)
        }
        
        request.method = .delete
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            
            let approxBioTextviewWidth = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approxBioTextviewWidth, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 20 + 20 + 12 + 15)
        }
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}

