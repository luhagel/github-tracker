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

func getAllCommitDates(repoList: [Repository], completion: @escaping ([String]) -> Void) {
  var dates: [String] = []
  var neededLength = 0
  for repo in repoList {
    WrapHub.getAllCommits(repositoryIdentifier: repo.owner.login + "/" + repo.name, completion: { (commits) in
      neededLength += 1
      for commit in commits {
        dates += [commit.commit.author.date]
      }
    })
    
    if neededLength == repoList.count {
      completion(dates)
    }
  }
}
