//
//  BarChartBarView.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/24/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class BarChartBarView: UIView {

  init(frame: CGRect, color: UIColor, username: String, commits: Int) {
    super.init(frame: frame)
    self.backgroundColor = color
    let nameLabel = UILabel(frame: CGRect(x: 5, y: 1, width: 200, height: 18))
    nameLabel.text = "username - \(commits)"
    self.addSubview(nameLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
