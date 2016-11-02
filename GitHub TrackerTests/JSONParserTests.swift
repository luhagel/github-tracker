//
//  JSONParserTests.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/16/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import GitHub_Tracker

class JSONParserTests: XCTestCase {
    
    var testJSON: JSON!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let path = Bundle.main.path(forResource: "test", ofType: "json")
        dump(path)
        let jsonData = NSData(contentsOfFile: path!)
        self.testJSON = JSON(data: jsonData as! Data)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSONToGithubUser() {
        let testUser = WrapHubJSONParser.parseJSONToGithubUser(userJSON: self.testJSON["user"])
        
        
        XCTAssert(testUser.login == "octocat")
        XCTAssert(testUser.id == 1)
        XCTAssert(testUser.avatarURL == "https://github.com/images/error/octocat_happy.gif")
        XCTAssert(testUser.gravatarId == "")
        XCTAssert(testUser.apiURL == "https://api.github.com/users/octocat")
        XCTAssert(testUser.profileURL == "https://github.com/octocat")
        XCTAssert(testUser.followersURL == "https://api.github.com/users/octocat/followers")
        //XCTAssert(testUser.followingURL == "https://api.github.com/users/octocat/following")
        //XCTAssert(testUser.gistsURL == "https://api.github.com/users/octocat/gists")
        //XCTAssert(testUser.starredURL == "https://api.github.com/users/octocat/starred")
        XCTAssert(testUser.subscriptionsURL == "https://api.github.com/users/octocat/subscriptions")
        XCTAssert(testUser.organizationsURL == "https://api.github.com/users/octocat/orgs")
        
    }
    
}
