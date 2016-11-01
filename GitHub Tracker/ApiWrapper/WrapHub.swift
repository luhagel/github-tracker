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
    static func getGithubUser(userName: String, completion: @escaping (GithubUser) -> Void) {
        let url = baseUrl + "/users/" + userName
        WrapHubNetworkingHelper.apiCall(url: url, callback: { (res: JSON?) in
            if let userData = res {
                completion(WrapHubJSONParser.parseJSONToGithubUser(userJSON: userData))
            }
        })
    }
  
  //Get shorthand user info
    static func getCompactGithubUser(userName: String, completion: @escaping (CompactGithubUser) -> Void) {
        let url = baseUrl + "/users/" + userName
        WrapHubNetworkingHelper.apiCall(url: url, callback: { (res: JSON?) in
            if let userData = res {
                completion(WrapHubJSONParser.parseJSONToCompactGithubUser(userJSON: userData))
            }
        })
    }
  
  //Get Commit info
  static func getCommit(repositoryIdentifier: String, commitSHA: String, completion: @escaping (Commit) -> Void) {
    let url = baseUrl + "/repos/" + repositoryIdentifier + "/commits/" + commitSHA
    WrapHubNetworkingHelper.apiCall(url: url, callback: { (res: JSON?) in
      if let commitData = res {
        completion(WrapHubJSONParser.parseJSONToCommit(commitJSON: commitData))
      }
    })
  }
  
  static func getAllCommits(repositoryIdentifier: String, completion: @escaping ([Commit]) -> Void) {
    let url = baseUrl + "/repos/" + repositoryIdentifier + "/commits/"
    WrapHubNetworkingHelper.apiCall(url: url, callback: { (res: JSON?) in
      if let commitData = res {
        let rawCommitsArray: [JSON] = commitData.arrayValue
        var commitsArray: [Commit] = []
        for commit in rawCommitsArray {
          commitsArray += [WrapHubJSONParser.parseJSONToCommit(commitJSON: commit)]
        }
        completion(commitsArray)
      }
    })
  }
  
  
  //Get repository info
  static func getRepository(repositoryIdentifier: String, completion: @escaping (Repository) -> Void) {
    let url = baseUrl + "/commits/" + repositoryIdentifier
    WrapHubNetworkingHelper.apiCall(url: url, callback: { (res: JSON?) in
      if let repoData = res {
        completion(WrapHubJSONParser.parseJSONToRepository(repoJSON: repoData))
      }
    })
  }
  
    //Get an array of all repositories of a given user
    static func getAllPublicRepositories(for user: GithubUser) -> [Repository] {
        var repositoryArray: [Repository] = []
        
        for repoURL in self.getAllPublicRepoURLs(user: user) {
            WrapHubNetworkingHelper.apiCall(url: repoURL, callback: { repoJSON in
                repositoryArray += [WrapHubJSONParser.parseJSONToRepository(repoJSON: repoJSON!)]
            })
        }
        return repositoryArray
    }

    
    private static func getAllPublicRepoURLs(user: GithubUser) -> [String] {
        var repoArrary: [String] = []
        
        WrapHubNetworkingHelper.apiCall(url: user.reposURL, callback: { reposJSON in
            if let reposArray = reposJSON?.arrayValue {
                for repo in reposArray {
                    var mutableRepoURL: String = repo["url"].string!
                    mutableRepoURL.removeLastCharacters(numberOfCharacters: 4)
                    repoArrary.append(mutableRepoURL)
                }
            }
        })
        return repoArrary
    }
}

