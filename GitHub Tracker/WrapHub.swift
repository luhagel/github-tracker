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
    static func getUser(userName: String, completion: @escaping (GithubUser) -> Void) {
        let url = baseUrl + "/users/" + userName
        self.apiCall(url: url, callback: { (res: JSON?) in
            if let userData = res {
                completion(parseJSONToGithubUser(userJSON: userData))
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
    
    private static func parseJSONToGithubUser(userJSON: JSON) -> GithubUser {
        let user: GithubUser = GithubUser(id: userJSON["id"].intValue,
                                          login: userJSON["login"].stringValue,
                                          avatarURL: userJSON["avatar_url"].stringValue,
                                          gravatarId: userJSON["gravatar_id"].stringValue,
                                          apiURL: userJSON["url"].stringValue,
                                          profileURL: userJSON["profile_url"].stringValue,
                                          followersURL: userJSON["followers_url"].stringValue,
                                          followingURL: userJSON["following_url"].stringValue,
                                          gistsURL: userJSON["gists_url"].stringValue,
                                          starredURL: userJSON["starred_url"].stringValue,
                                          subscriptionsURL: userJSON["subscriptions_url"].stringValue,
                                          reposURL: userJSON["repos_url"].stringValue,
                                          eventsURL: userJSON["events_url"].stringValue,
                                          receivedEventsURL: userJSON["received_events_url"].stringValue,
                                          type: userJSON["type"].stringValue,
                                          siteAdmin: userJSON["site_admin"].boolValue,
                                          name: userJSON["name"].stringValue,
                                          company: userJSON["company"].stringValue,
                                          blog: userJSON["blog"].stringValue,
                                          location: userJSON["location"].stringValue,
                                          email: userJSON["email"].stringValue,
                                          hireable: userJSON["hireable"].boolValue,
                                          bio: userJSON["bio"].stringValue,
                                          publicRepos: userJSON["public_repos"].intValue,
                                          publicGists: userJSON["public_gists"].intValue,
                                          followers: userJSON["followers"].intValue,
                                          following: userJSON["following"].intValue,
                                          createdAt: userJSON["created_at"].stringValue,
                                          updatedAt: userJSON["updated_at"].stringValue)
        return user
    }
}
