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
  
  for user in users {
    let currentStreak = 20
    let longestStreak = 40
    let chartDataForUser: ChartData = ChartData(userName: user, currentStreak: currentStreak, longestStreak: longestStreak)
    
    chartData += [chartDataForUser]
  }
  
  return chartData
}

func calcCurrentCommitStreak(commits: [Commit]) -> Int{
  var currentStreak = 0
  
  return currentStreak
}
