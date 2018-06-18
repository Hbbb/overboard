//
//  ViewController.swift
//  overboard
//
//  Created by Harrison Borges on 5/30/18.
//  Copyright © 2018 ping. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    ApiClient().createBoard(text: "I am a really dope board")
  }
}
