//
//  Helpers.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/31/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation

func getChartData(for users: [String]) -> [ChartData] {
  var chartData: [ChartData] = []
  
  for username in users {
    WrapHub.getGithubUser(userName: username, completion: { githubUser in
      let currentStreak = calcCurrentCommitStreak(for: githubUser)
      let longestStreak = 40
      let chartDataForUser: ChartData = ChartData(userName: username, currentStreak: currentStreak, longestStreak: longestStreak)
      
      chartData += [chartDataForUser]
    })
  }
  return chartData
}

fileprivate func calcCurrentCommitStreak(for user: GithubUser) -> Int {
  let currentStreak = 9
  
  return currentStreak
}

fileprivate func getAllCommitDates(repoList: [Repository]) -> [String] {
  var dates: [String] = []
  for repo in repoList {
    WrapHub.getAllCommits(repositoryIdentifier: repo.name, completion: { (commits) in
      for commit in commits {
        dates += [commit.commit.author.date]
      }
    })
  }
  return dates
}
