//
//  WrapHub.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/12/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Alamofire
import SwiftyJSON

class WrapHub {
    private static let baseUrl: String = "https://api.github.com"
    
    
    //Get User Info
    static func getUser(userName: String, completion: @escaping (Any) -> Void) {
        let url = baseUrl + "/users/" + userName
        self.apiCall(url: url, callback: { (res: JSON?) in
            if let userData = res {
                completion(userData)
            }
        })
    }
    
    
    //Generic API Call - call from other functions
    private static func apiCall(url: String, callback: @escaping (JSON?) -> ()) {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                callback(JSON(value))
            case .failure(let error):
                print(error)
            }
        }
    }
}
