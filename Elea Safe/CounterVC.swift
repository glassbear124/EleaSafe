//
//  CounterVC.swift
//  Elea Safe
//
//  Created by NAROLA on 7/5/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import UIKit
import AVFoundation


class CounterVC: UIViewController {
  
  var playBeap: AVAudioPlayer?
  var soundTimer: Timer!
    let sound = NSDataAsset(name: "beapSound")!
  
  
  override func loadView() {

    let counterView = CounterView(frame: UIScreen.main.bounds)
    self.view = counterView

//    // Register to receive notification
//    NotificationCenter.default.addObserver(self, selector: #selector(self.stopSoundTimer), name: NSNotification.Name(rawValue: "NotificationIdentifierStop"), object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(self.startSoundTimer), name: NSNotification.Name(rawValue: "NotificationIdentifierStart"), object: nil)

    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        playBeap = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
        playBeap?.prepareToPlay()
        playBeap?.volume = 1.0
    } catch {}

    counterView.didUpdateTeeth = {
        self.playSound()
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addRightNavItemOnView()
  }
  
  func addRightNavItemOnView () {
    self.navigationItem.rightBarButtonItem = nil;
    
    let buttonGear: UIButton = UIButton(type: UIButtonType.custom) as UIButton
    buttonGear.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    buttonGear.setImage(navigationCronIcon, for: UIControlState())
    
    let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonGear)
    self.navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
  }
  
  func playSound() {
    guard let playBeap = playBeap  else { return }
    playBeap.play()
  }
  
  func startSoundTimer() {
    let aSelector : Selector = #selector(CounterVC.playSound)
    soundTimer = Timer.scheduledTimer(timeInterval: 0.62, target: self, selector: aSelector, userInfo: nil, repeats: true)
  }
  
  func stopSoundTimer() {
    if soundTimer != nil {
      soundTimer.invalidate()
    }
  }
  
//  override func viewWillDisappear(_ animated: Bool) {
//    stopSoundTimer()
//  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  }
  
  
  
}
