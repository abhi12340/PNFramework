//
//  ViewController.swift
//  TestApp
//
//  Created by Abhishek Kumar on 23/07/20.
//  Copyright © 2020 Abhishek. All rights reserved.
//

import UIKit
import PNFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("->",PAService.getService())
        // Do any additional setup after loading the view.
    }


}

