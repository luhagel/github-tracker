//
//  WrapHubNetworkingHelper.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/15/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WrapHubNetworkingHelper {
    static func apiCall(url: String, callback: @escaping (JSON?) -> ()) {
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
