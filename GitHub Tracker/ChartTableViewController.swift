//
//  ChartTableViewController.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/28/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "tracker_bg")
        let backgroundView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = backgroundView
        self.tableView.backgroundView?.contentMode = .scaleAspectFill

        WrapHub.getGithubUser(userName: "luhagel", completion: { user in
          WrapHub.getAllPublicRepositories(for: user) { repoList in
            getAllCommitDates(repoList: repoList) { commitDates in
              print(commitDates)
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

}
