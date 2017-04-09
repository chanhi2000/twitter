//
//  Service.swift
//  twitter
//
//  Created by LeeChan on 4/9/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    func fetchHomefeed(completion: @escaping (HomeDatasource) -> ()) {
        // JSON Fetch starts here: TRON way
        print("fetching homefeed")
        
        let request: APIRequest<HomeDatasource,JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print("successfully fetched the json objects")
            
//            print(homeDatasource.users.count)
//            self.datasource = homeDatasource
            completion(homeDatasource)
            
        }) { (error) in
            print("failure to fetch json", error)
        }
        
        request.method = .delete
        print("step 2")
    }
}
