//
//  HomeVC.swift
//  Elea Safe
//
//  Created by NAROLA on 7/3/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import UIKit
import SCLAlertView

class HomeVC: UIViewController {

  
  override func viewDidLoad() {
    super.viewDidLoad()
    commonSetup()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func commonSetup() {
    addNavigationLogo()
    addRightNavItemOnView()
    hideBottomBorder()

  }
  
  func addNavigationLogo() {
    let imageView = UIImageView(image:navigationBarLogo)
    self.navigationItem.titleView = imageView
  }
  
  func addRightNavItemOnView () {
    self.navigationItem.rightBarButtonItem = nil;
    
    let buttonGear: UIButton = UIButton(type: UIButtonType.custom) as UIButton
    buttonGear.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    buttonGear.setImage(navigationGearIcon, for: UIControlState())
    buttonGear.addTarget(self, action: #selector(HomeVC.rightNavButtonClick(_:)), for: UIControlEvents.touchUpInside)
    
    let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonGear)
    self.navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
  }
  
  func customEmergencyNumber() {
    print(userDefaults.object(forKey: "customEmergencyNumber")!)
  }
  
  // Remove the border ImageView from the NavigationBar background
  func hideBottomBorder() {
    for parent in self.navigationController!.navigationBar.subviews {
      for childView in parent.subviews {
        if(childView is UIImageView) {
          childView.removeFromSuperview()
        }
      }
    }
  }
  
  func rightNavButtonClick(_ sender:UIButton!) {
    // Get started
    // Add a text field
    let alert = SCLAlertView()
    let txt = alert.addTextField("911")
    alert.addButton("GUARDAR") {
      userDefaults.set(txt.text, forKey: "customEmergencyNumber")
      //      print("Text value: \(txt.text)")
    }
    alert.showInfo("Editar Número", subTitle: "Modifique aquí el número de emergencias.")
    
    
//    let alert = UIAlertController(title: "Titulo de Alerta", message: "Mensaje de Alerta", preferredStyle: .Alert)
//    
//    alert.addTextFieldWithConfigurationHandler { (UITextField) in
//      UITextField.placeholder = "Texto de Placeholder"
//    }
//    
//    let confirmAction = UIAlertAction(title: "Confirmar", style: .Cancel) { (action:UIAlertAction) in
//      let fields = alert.textFields!
//      emergencyNumber = fields[0].text!
//      let userDefaults = NSUserDefaults.standardUserDefaults()
//      userDefaults.setObject(emergencyNumber, forKey: "customEmergencyNumber")
//    }
//    alert.addAction(confirmAction)
//    
//    let destroyAction = UIAlertAction(title: "Cancelar", style: .Destructive) { (action) in
//    }
//    alert.addAction(destroyAction)
//    
//    self.presentViewController(alert, animated: true) {
//    }
    
  }
  
  @IBAction func callEmergency(_ sender: AnyObject) {
    if let url = URL(string: "tel://\(userDefaults.object(forKey: "customEmergencyNumber")!)") {
      UIApplication.shared.openURL(url)
      print(userDefaults.object(forKey: "customEmergencyNumber")!)
    }
  }

  
}

