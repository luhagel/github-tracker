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
    static let baseUrl: String = "https://api.github.com"
    static let url = baseUrl + "/users/luhagel"
    static func apiCall() {
        Alamofire.request(WrapHub.url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
