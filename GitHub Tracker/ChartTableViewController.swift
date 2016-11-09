//
//  ChartTableViewController.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/28/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit
import SwiftDate

struct ChartData {
  let userName: String
  let currentStreak: Int
  let longestStreak: Int
}

class ChartTableViewController: UITableViewController {
  
  let testArray: [String] = [
      "luhagel",
      "guti7",
      "FanisaKim",
      "Nicholas-Swift",
      "Wilsonilo",
      "davidkc0",
      "jakezeal"
    ]
  
    let testData: [ChartData] = [
        ChartData(userName: "luhagel", currentStreak: 21, longestStreak: 21),
        ChartData(userName: "guti7", currentStreak: 18, longestStreak: 21),
        ChartData(userName: "FanisaKim", currentStreak: 14, longestStreak: 21),
        ChartData(userName: "Nicholas-Swift", currentStreak: 7, longestStreak: 21),
        ChartData(userName: "davidkc0", currentStreak: 4, longestStreak: 21),
        ChartData(userName: "jakezeal", currentStreak: 2, longestStreak: 21)
    ]
  
    var testDates: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "tracker_bg")
        let backgroundView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = backgroundView
        self.tableView.backgroundView?.contentMode = .scaleAspectFill

        WrapHub.getGithubUser(userName: "luhagel", completion: { user in
          WrapHub.getAllPublicRepositories(for: user) { repoList in
            self.getAllCommitDates(repoList: repoList) { commitDates in
              self.testDates += commitDates
              
              print(self.calcCurrentStreak(rawDates: self.testDates))
            }
          }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return testData.count
    }
  
    // Set the spacing between sections
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 5
    }
  
    // Make the background color show through
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let headerView = UIView()
      headerView.backgroundColor = UIColor.clear
      return headerView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarChartCell", for: indexPath) as! BarChartTableViewCell
        let currentUserCommits: Int = testData[indexPath.section].currentStreak
        let currentUserName: String = testData[indexPath.section].userName
      
        cell.contentView.layer.cornerRadius = 10

        // Configure the cell...
        cell.contentView.addSubview(BarChartBarView(frame: CGRect(x: 20, y: 10, width: currentUserCommits, height: 20), color: .green, username: currentUserName, commits: currentUserCommits))

        return cell
    }
  
    func getAllCommitDates(repoList: [Repository], completion: @escaping (Set<String>) -> Void) {
      for repo in repoList {
        WrapHub.getAllCommits(repositoryIdentifier: repo.owner.login + "/" + repo.name, completion: { (commits) in
          var dates: Set<String> = []
          for commit in commits {
            let commitDate: String = self.removeLastCharacters(string: commit.commit.author.date, numberOfCharacters: 10)
            dates.insert(commitDate)
          }
          completion(dates)
        })
      }
    }
  
  func populateUserData(dates: [String], user: String) {
    
  }
  
  func calcCurrentStreak(rawDates: [String]) -> [DateInRegion] {
    var dates: [DateInRegion] = []
    let sf = Region(tz: TimeZoneName.americaLosAngeles, cal: .gregorian, loc: LocaleName.english)
    for date in rawDates {
      let newDate: DateInRegion = try! DateInRegion(string: date, format: .custom("yyyy-MM-dd"), fromRegion: sf)
      dates += [newDate]
    }
    dates = dates.sorted()
    
    return dates
  }
  
  func removeLastCharacters( string: String, numberOfCharacters: Int) -> String {
    var string = string
    let startIndex = string.index(string.startIndex, offsetBy: string.characters.count-numberOfCharacters)
    let endIndex = string.index(string.startIndex, offsetBy: string.characters.count-1)
    let range = startIndex...endIndex
    string.removeSubrange(range)
    return string
  }
}
