//
//  Hemlich.swift
//  Elea Safe
//
//  Created by NAROLA on 7/3/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import UIKit

class Hemlich: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "adultHemlichSegue" {
      isTutorialFor = "adultHemlich"
    }
    if segue.identifier == "teenHemlichSegue" {
      isTutorialFor = "teenHemlich"
    }
    if segue.identifier == "babyHemlichSegue" {
      isTutorialFor = "babyHemlich"
    }
    
  }
  
  
}
