//
//  WrapHubUserTests.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/13/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import GitHub_Tracker

class WrapHubUserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
//        let path = Bundle.main.path(forResource: "testData", ofType: "json")
//        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!))
//        let testData = JSON(data: jsonData!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetUserReturnsUser() {
        WrapHub.getUser(userName: "luhagel", completion: { user in
            XCTAssert(user.login != "luhagel", "getUser returned nil")
        })
    }
    
    func testParseJSONToGithubUserReturnsUserType() {
        WrapHub.getUser(userName: "luhagel", completion: { user in
            XCTAssert(user.name == "Luca Hagel", "invalid name")
            XCTAssert(user.login == "luhagel", "invalid login name")
        })
    }
    
    func testGetAllPublicRepositoriesReturnsNonemptyArray() {
        WrapHub.getUser(userName: "luhagel", completion: { user in
            XCTAssert(WrapHub.getAllPublicRepositories(for: user).count > 0, "getAllPublicPeositories returned empty Array")
        })
    }
}
