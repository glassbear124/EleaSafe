//
//  Constants.swift
//  Elea Safe
//
//  Created by NAROLA on 7/3/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import UIKit
import Foundation


// MARK: - Elea Counter
var isDisplayLinkRuning: Bool           = false
let numberOfTeeth:UInt                  = 100// Number of teetch to render
let teethSize                           = CGSize(width: 1, height: 20)
let animationDuration:TimeInterval      = 57.18// The duration of the animation

let highlightColor                      = UIColor(hexString: "#3192DB") //UIColor(red: 251.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 0.8)
let inactiveColor                       = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1)

var progress:TimeInterval               = 0.0// The progress of the loader
var paths                               = NSArray()// The array containing the UIBezier paths
var displayLink                         = CADisplayLink()// The display link to update the progress
var teethHighlighted:UInt               = 0// Number of teeth highlighted
var startTime                           = TimeInterval()// Variable for storing the start time
var timer                               = Timer()// Timer Variable
var compressionNumber:UInt              = 0// Number of compressions

let fixedTeethSize                      = CGSize(width: 17, height: 20)
var fixedPaths                          = NSArray()// The array containing the UIBezier paths

 
// MARK: - Elea Base Color Palette
let black         = UIColor(hexString: "#000000")
let white         = UIColor(hexString: "#ffffff")
let backGround    = UIColor(hexString: "#3192DB")
let backToGround  = UIColor(hexString: "#086cd6") // 116ed1 216cd4

// MARK: - Elea Base Fonts
let boldTypography75  = UIFont (name: "Helvetica-Bold", size: 75)
let boldTypography100 = UIFont (name: "Helvetica-Bold", size: 100)
let boldTypography135 = UIFont (name: "Helvetica-Bold", size: 135)


// MARK: - Brand assets
let navigationBarLogo   = UIImage(named: "brandLogoMenu.png")
let navigationGearIcon  = UIImage(named: "gearButton.png")
let navigationCronIcon  = UIImage(named: "cronIcon.png")


// Set userDefaults
let userDefaults         = UserDefaults.standard

//var emergencyNumber = "911"
//var CustomEmergencyNumber = ""

