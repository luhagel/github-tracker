//
//  ViewController.swift
//  GitHub Tracker
//
//  Created by Luca Hagel on 10/12/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        WrapHub.apiCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

