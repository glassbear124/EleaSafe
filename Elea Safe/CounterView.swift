//
//  CounterView.swift
//  Elea Safe
//
//  Created by NAROLA on 7/5/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CounterView : UIView {
  
  var timerLabel: UILabel = UILabel()
  var compressionCountLabel: UILabel = UILabel()
  var compressionFixedLabel: UILabel = UILabel()
  let button = UIButton();
//  let emergencybutton = UIButton();
  var isCounterRunning: Bool = true
//  var playBeap: AVAudioPlayer?
//  var soundTimer: Timer!
  let notificationName = Notification.Name("NotificationIdentifier")

    var didUpdateTeeth: (Void) -> (Void) = {}


  override init(frame: CGRect) {
    super.init(frame: frame)
    commonSetup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonSetup()
  }
  
  fileprivate func commonSetup() {
    self.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    fixedPaths = getPaths(frame.size, teethCount: numberOfTeeth, teethSize: fixedTeethSize, radius: ((frame.width*0.4)-fixedTeethSize.height)) as NSArray
    paths = getPaths(frame.size, teethCount: numberOfTeeth, teethSize: teethSize, radius: ((frame.width*0.4)-teethSize.height)) as NSArray
    
    if isDisplayLinkRuning == false {
      displayLink = CADisplayLink(target: self, selector: #selector(displayLinkDidFire))
      displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
      isDisplayLinkRuning = true
      
    }else {
      displayLinkWillStop()
      progress = 0.0
      displayLink = CADisplayLink(target: self, selector: #selector(displayLinkDidFire))
      displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
    }
    
    addTimerLabel()
    addCompressionsLabels()
    addEmergencyButton()
    startTimer()
    btnstart()
    
    // Customer asked for counter NOT to autoplay
    button .sendActions(for: UIControlEvents.touchUpInside)
  }
  
  func displayLinkDidFire() {
    
    progress += displayLink.duration/animationDuration
    
    if (progress > 1) {
      progress -= 1
    }
    
    let t = teethHighlighted
    print(t)

    teethHighlighted = UInt(round(progress*TimeInterval(numberOfTeeth))) // Calculate the number of teeth to highlight


    if (t != teethHighlighted) { // Only call setNeedsDisplay if the teethHighlighted changed
      setNeedsDisplay()

      // Update compressions Label
      compressionCountLabel.text = String(teethHighlighted)

        didUpdateTeeth()
    }
  }
  
  func displayLinkWillStop() {
    displayLink.invalidate()
  }
  
  func updateTime() {
    
    let currentTime = Date.timeIntervalSinceReferenceDate
    var elapsedTime: TimeInterval = currentTime - startTime
    
    //let minutes = UInt8(elapsedTime / 60.0)
    //elapsedTime -= (TimeInterval(minutes) * 60.0)
    // let strMinutes = String(format: "%02d", minutes)
    
    let seconds = UInt8(elapsedTime)
    elapsedTime -= TimeInterval(seconds)
    
    let strSeconds = String(format: "%02d", seconds)
    let strMilliseconds:String = String(elapsedTime)
    
    let startIndex = strMilliseconds.index(strMilliseconds.startIndex, offsetBy: 2)
    let endIndex = strMilliseconds.index(strMilliseconds.startIndex, offsetBy: 2)
    
    timerLabel.text = "\(strSeconds)" + "\''" + "\(strMilliseconds[startIndex...endIndex])"
    
    if strSeconds == "60" {
        stopTimer()
        startTimer()
    }
    
  }
  
  func startTimer() {
    let aSelector : Selector = #selector(CounterView.updateTime)
    timer = Timer.scheduledTimer(timeInterval: 0.00, target: self, selector: aSelector, userInfo: nil, repeats: true)
    startTime = Date.timeIntervalSinceReferenceDate
  }
  
  func stopTimer() {
    timer.invalidate()
  }
  
  func resumeTimer() {
    let aSelector : Selector = #selector(CounterView.updateTime)
    timer = Timer.scheduledTimer(timeInterval: 0.00, target: self, selector: aSelector, userInfo: nil, repeats: true)
    startTime = Date.timeIntervalSinceReferenceDate
  }
  
//  func playSound() {
//    guard let sound = NSDataAsset(name: "beapSound") else {
//      print("asset not found")
//      return
//    }
//    do {
//      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//      try AVAudioSession.sharedInstance().setActive(true)
//      
//      playBeap = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
//      playBeap!.play()
//    } catch let error as NSError {
//      print("error: \(error.localizedDescription)")
//    }
//  }
//  
//  func startSoundTimer() {
//    let aSelector : Selector = #selector(CounterView.playSound)
//    soundTimer = Timer.scheduledTimer(timeInterval: 0.62, target: self, selector: aSelector, userInfo: nil, repeats: true)
//  }
//  
//  func stopSoundTimer() {
//    if soundTimer != nil {
////      print("Contains a value!")
//      soundTimer.invalidate()
//    }
//  }
  
  override func draw(_ rect: CGRect) {
    
    let ctx = UIGraphicsGetCurrentContext()
    
    // Configure Background
    var path: UIBezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 0, height: 0))
    path = UIBezierPath(ovalIn: CGRect(x: 30, y: (frame.height/4)+5, width: frame.width-60, height: frame.width-60))
    let backgroundCounterColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    backgroundCounterColor.setFill()
    path.fill()
    // End of Background configuration
    
    ctx!.scaleBy(x: -1, y: -1) // Flip the context to the correct orientation
    ctx!.translateBy(x: -rect.size.width, y: -rect.size.height)
    
    for (index, path) in fixedPaths.enumerated() { // Draw each STATIC 'tooth'
      
      ctx!.addPath((path as AnyObject).cgPath)
      
      let fillColor = (UInt(index) <= teethHighlighted) ? highlightColor:white;
      
      ctx!.setFillColor(fillColor.cgColor)
      ctx!.fillPath()
    }
    
    for (index, path) in paths.enumerated() { // Draw each 'tooth'
      
      ctx!.addPath((path as AnyObject).cgPath)
      
      let fillColor = (UInt(index) <= teethHighlighted) ? inactiveColor:black;
      
      ctx!.setFillColor(fillColor.cgColor)
      ctx!.fillPath()
    }

  }
  
  func addEmergencyButton() {
    let image = UIImage(named: "callEmergencyButtonRCP") as UIImage?
    let emergencybutton = UIButton(frame: CGRect(x: frame.width-100, y: frame.height-225, width: 80, height: 80))
    
    emergencybutton.setImage(image, for: UIControlState())
    emergencybutton.addTarget(self, action: #selector(callEmergencyAction), for: .touchUpInside)
    
    self.addSubview(emergencybutton)
  }
  
  func callEmergencyAction(_ sender: UIButton!) {
    if let url = URL(string: "tel://\(userDefaults.object(forKey: "customEmergencyNumber")!)") {
      UIApplication.shared.openURL(url)
      print(userDefaults.object(forKey: "customEmergencyNumber")!)
    }
  }
  
  func addTimerLabel() {
    timerLabel.frame = CGRect(x: 10, y: 15, width: frame.width-5, height: 120)
    timerLabel.font = boldTypography75
    
    timerLabel.textAlignment = NSTextAlignment.center
    timerLabel.textColor = backToGround
    timerLabel.text = "00''0"
    timerLabel.isHidden = false
    self.addSubview(timerLabel)
  }
  
  func addCompressionsLabels(){
    compressionCountLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height-75)
    compressionCountLabel.font = boldTypography135
    
    compressionFixedLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height+50)
    compressionFixedLabel.font  = compressionFixedLabel.font.withSize(15)
    
    compressionCountLabel.textAlignment = NSTextAlignment.center
    compressionCountLabel.textColor = backToGround
    compressionCountLabel.text = "0"
    compressionCountLabel.isHidden=false
    self.addSubview(compressionCountLabel)
    
    compressionFixedLabel.textAlignment = NSTextAlignment.center
    compressionFixedLabel.textColor = UIColor.black
    compressionFixedLabel.text = "COMPRESIONES"
    compressionFixedLabel.isHidden = false
    self.addSubview(compressionFixedLabel)
    
  }
  
  func btnstart() {
    button.setTitle("DETENER", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 22)
    button.setTitleColor(UIColor.white, for: UIControlState())
    button.backgroundColor = backToGround
    button.frame = CGRect(x: 20, y: frame.height-130, width: frame.width-40, height: 50) // X, Y, width, height
    button.layer.cornerRadius = 12
    button.addTarget(self, action: #selector(CounterView.buttonPressed(_:)), for: .touchUpInside)
    self.addSubview(button)
  }
  
  func buttonPressed(_ sender: UIButton!) {
    if isCounterRunning == true {
      button.setTitle("COMENZAR", for: UIControlState())
      
      stopTimer()
//      stopSoundTimer()
      // Pause Counter
      displayLinkWillStop()
      
      isCounterRunning = false
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationIdentifierStop"), object: nil)
      
    } else {
      button.setTitle("DETENER", for: UIControlState())
      
      startTimer()
//      startSoundTimer()
      // Resume Counter
      
      displayLink = CADisplayLink(target: self, selector: #selector(displayLinkDidFire))
      displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
      progress = 0.0
      isDisplayLinkRuning = true
      
      isCounterRunning = true
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationIdentifierStart"), object: nil)
    }
  }
  
  
  func getPaths(_ size:CGSize, teethCount:UInt, teethSize:CGSize, radius:CGFloat) -> [UIBezierPath] {
    
    var halfHeight: CGFloat = 0
    var halfWidth: CGFloat = 0
    
    halfHeight = size.height/2.3;
    halfWidth = size.width/2;
    
    let deltaAngle = CGFloat(2*M_PI)/CGFloat(teethCount); // The change in angle between paths
    
    // Create the template path of a single shape.
    let p = CGPath(rect: CGRect(x: -teethSize.width*0.5, y: radius, width: teethSize.width, height: teethSize.height), transform: nil);
    
    var pathArray = [UIBezierPath]()
    for i in 0..<teethCount { // Copy, translate and rotate shapes around
      
      let translate = CGAffineTransform(translationX: halfWidth, y: halfHeight);
      var rotate = translate.rotated(by: deltaAngle*CGFloat(i))
      let pathCopy = p.copy(using: &rotate)!
      
      pathArray.append(UIBezierPath(cgPath: pathCopy)) // Populate the array
    }
    
    return pathArray
  }

  
  
}
