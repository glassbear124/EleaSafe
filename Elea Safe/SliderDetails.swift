//
//  SliderDetails.swift
//  Ellea_CPR
//
//  Created by NAROLA on 3/23/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import UIKit

class SliderDetails: UIViewController {

  @IBOutlet fileprivate weak var coachImageView: UIImageView!
  @IBOutlet fileprivate weak var coachTextLabel: UILabel!
  
  var coachImage: UIImage?
  var coachText: String?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    coachImageView.image = coachImage
    coachTextLabel.text = coachText
  }
  
  
}
