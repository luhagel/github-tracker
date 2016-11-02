//
//  GitHub_TrackerTests.swift
//  GitHub TrackerTests
//
//  Created by Luca Hagel on 10/12/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import GitHub_Tracker

class GitHub_TrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let vc = storyBoard.instantiateInitialViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testGetAllCommitDates() {
    WrapHub.getGithubUser(userName: "luhagel", completion: { user in
      let repoList = WrapHub.getAllPublicRepositories(for: user)
      let commitDates = getAllCommitDates(repoList: repoList)
      assert(commitDates.count > 0)
    })
  }
}
