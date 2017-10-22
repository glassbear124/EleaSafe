//
//  SliderVC.swift
//  Ellea_CPR
//
//  Created by NAROLA on 3/23/16.
//  Copyright © 2016 Brandigital. All rights reserved.
//

import UIKit


var isTutorialFor: String = ""
//var isRCPFirstTime: Bool = true
//var isHemlichFirstTime: Bool = true

class SliderVC: UIViewController, UIScrollViewDelegate {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var CoachMarkBackground: UIImageView!
  @IBOutlet weak var CoachMarkText: UILabel!
  @IBOutlet weak var CoachMarkImage: UIImageView!
  
  
  var pages = [SliderDetails]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setScrollBarHidden ()
    sliderData()
  }
  
  func createAndAddTutorialStep(_ coachImageName: String, coachTextName: String) -> SliderDetails {
    let sliderDetails = storyboard!.instantiateViewController(withIdentifier: "SliderDetails") as! SliderDetails
    sliderDetails.view.translatesAutoresizingMaskIntoConstraints = false
    sliderDetails.coachImage = UIImage(named: coachImageName)
    sliderDetails.coachText = coachTextName
    
    scrollView.addSubview(sliderDetails.view)
    
    addChildViewController(sliderDetails)
    sliderDetails.didMove(toParentViewController: self)
    
    return sliderDetails
  }
  
  func sliderData() {
    
    switch (isTutorialFor) {
      case "adultRpc":
        
        RCPFirstTime()
        self.title = "ADULTOS"
        let page1 = createAndAddTutorialStep("adultos_rcp_4", coachTextName: "1. Evitar que no haya nada cerca que pueda poner en riesgo nuestra vida y la de la víctima.")
        let page2 = createAndAddTutorialStep("adultos_rcp_1", coachTextName: "2. Verificar si la víctima no responde sacudiéndole un hombro y preguntándole en voz alta ¿qué le pasa?.")
        let page3 = createAndAddTutorialStep("adultos_rcp_2", coachTextName: "3. Si es posible, pedir firmemente a otra persona que se comunique con el servicio de emergencias marcando el 911, sino hacerlo nosotros. Hacer énfasis en la necesidad de tener a la brevedad un desfibrilador externo automático.")
        let page4 = createAndAddTutorialStep("adultos_rcp_3", coachTextName: "4. Observe si respira. No se tome más de 10 segundos en hacerlo. Si no hay respiración o respira entrecortadamente iniciar la RCP.")
        let page5 = createAndAddTutorialStep("adultos_rcp_4", coachTextName: "5. Descubrir el pecho.")
        let page6 = createAndAddTutorialStep("adultos_rcp_5", coachTextName: "6. Ponerse en cuclillas al costado del pecho de la víctima. Con los brazos extendidos, una mano arriba de la otra, colocar el talón de la mano en el centro del esternón a la altura de las tetillas (zona pectoral).")
        let page7 = createAndAddTutorialStep("adultos_rcp_6", coachTextName: "7. Presionar a un ritmo de 100 a 120 compresiones por minuto como mínimo. El esternón debe deprimirse 5 centímetros aproximadamente.")
        let page8 = createAndAddTutorialStep("adultos_rcp_7", coachTextName: "8. Continuar ininterrumpidamente con solo compresión torácica hasta que llegue auxilio médico o que la persona reaccione. Es fundamental que no haya interrupciones y que entre compresión y compresión el tórax vuelva a su volumen normal.")
        let page9 = createAndAddTutorialStep("adultos_rcp_8", coachTextName: "9. Si la persona responde colocarla en posición de seguridad, de costado con la cabeza apoyada en uno de sus brazos.")
        
        pages = [page1, page2, page3, page4, page5, page6, page7, page8, page9]
        pageControl.numberOfPages = 9
        
        let views = ["view": view!, "page1": page1.view!, "page2": page2.view!, "page3": page3.view!, "page4": page4.view!, "page5": page5.view!, "page6": page6.view!, "page7": page7.view!, "page8": page8.view!, "page9": page9.view!]
        
        let horizontalConstraints =
        NSLayoutConstraint.constraints( withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)][page5(==view)][page6(==view)][page7(==view)][page8(==view)][page9(==view)]|", options: [] , metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
      
      case "teenRpc":
        
        RCPFirstTime()
        self.title = "NIÑOS"
        let page1 = createAndAddTutorialStep("nino_rcp_5", coachTextName: "1. Evitar que no haya nada cerca que pueda poner en riesgo nuestra vida y la de la víctima.")
        let page2 = createAndAddTutorialStep("nino_rcp_1", coachTextName: "2. Verificar si la víctima no responde sacudiéndole un hombro y preguntándole en voz alta ¿qué le pasa?.")
        let page3 = createAndAddTutorialStep("nino_rcp_2", coachTextName: "3. Si es posible, pedir firmemente a otra persona que se comunique con el servicio de emergencias marcando el 911, sino hacerlo nosotros. Hacer énfasis en la necesidad de tener a la brevedad un desfibrilador externo automático.")
        let page4 = createAndAddTutorialStep("nino_rcp_3", coachTextName: "4. Observe si respira. No se tome más de 10 segundos en hacerlo. Si no hay respiración o respira entrecortadamente iniciar la RCP.")
        let page5 = createAndAddTutorialStep("nino_rcp_4", coachTextName: "5. Descubrir el pecho.")
        let page6 = createAndAddTutorialStep("nino_rcp_5", coachTextName: "6. Ponerse en cuclillas al costado del pecho de la víctima. Con los brazos extendidos, una mano arriba de la otra, colocar el talón de la mano en el centro del esternón a la altura de las tetillas (zona pectoral).")
        let page7 = createAndAddTutorialStep("nino_rcp_6", coachTextName: "7. Presionar a un ritmo de 100 a 120 compresiones por minuto como mínimo. El esternón debe deprimirse 5 centímetros aproximadamente.")
        let page8 = createAndAddTutorialStep("nino_rcp_7", coachTextName: "8. Continuar ininterrumpidamente con solo compresión torácica hasta que llegue auxilio médico o que la persona reaccione. Es fundamental que no haya interrupciones y que entre compresión y compresión el tórax vuelva a su volumen normal.")
        let page9 = createAndAddTutorialStep("nino_rcp_8", coachTextName: "9. Si la persona responde colocarla en posición de seguridad, de costado con la cabeza apoyada en uno de sus brazos.")
        
        pages = [page1, page2, page3, page4, page5, page6, page7, page8, page9]
        pageControl.numberOfPages = 9
        
        let views = ["view": view!, "page1": page1.view!, "page2": page2.view!, "page3": page3.view!, "page4": page4.view!, "page5": page5.view!, "page6": page6.view!, "page7": page7.view!, "page8": page8.view!, "page9": page9.view!]
        
        let horizontalConstraints =
          NSLayoutConstraint.constraints( withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)][page5(==view)][page6(==view)][page7(==view)][page8(==view)][page9(==view)]|", options: [] , metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
      
      case "babyRpc":
        
        RCPFirstTime()
        self.title = "BEBES"
        let page1 = createAndAddTutorialStep("bebe_rcp_1", coachTextName: "1. Evitar que no haya nada cerca que pueda poner en riesgo nuestra vida y la de la víctima.")
        let page2 = createAndAddTutorialStep("bebe_rcp_1", coachTextName: "2. Si es posible, pedir firmemente a otra persona que se comunique con el servicio de emergencias marcando el 911, sino hacerlo nosotros.")
        let page3 = createAndAddTutorialStep("bebe_rcp_2", coachTextName: "3. Colocar al bebé en una superficie dura y lisa.")
        let page4 = createAndAddTutorialStep("bebe_rcp_3", coachTextName: "4. Comprobar si el bebé está inconsciente. No se tome más de 10 segundos en hacerlo. Si no hay respiración o respira entrecortadamente iniciar la RCP.")
        let page5 = createAndAddTutorialStep("bebe_rcp_2", coachTextName: "5. Descubrir el pecho.")
        let page6 = createAndAddTutorialStep("bebe_rcp_4", coachTextName: "6. Colocar dos dedos en el centro del esternón a la altura de las tetillas (pectorales).")
        let page7 = createAndAddTutorialStep("bebe_rcp_5", coachTextName: "7. Presionar a un ritmo de 100 compresiones por minuto como mínimo. El esternón del bebé debe deprimirse 4 centímetros aproximadamente.")
        let page8 = createAndAddTutorialStep("bebe_rcp_5", coachTextName: "8. Continuar ininterrumpidamente con solo compresión torácica hasta que llegue auxilio médico o que la persona reaccione. Es fundamental que no haya interrupciones y que entre compresión y compresión el tórax vuelva a su volumen normal.")
        let page9 = createAndAddTutorialStep("bebe_rcp_6", coachTextName: "9. Si la persona responde colocarla en posición de seguridad, de costado con la cabeza apoyada en uno de sus brazos.")
        
        pages = [page1, page2, page3, page4, page5, page6, page7, page8, page9]
        pageControl.numberOfPages = 9
        
        let views = ["view": view!, "page1": page1.view!, "page2": page2.view!, "page3": page3.view!, "page4": page4.view!, "page5": page5.view!, "page6": page6.view!, "page7": page7.view!, "page8": page8.view!, "page9": page9.view!]
        
        let horizontalConstraints =
          NSLayoutConstraint.constraints( withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)][page5(==view)][page6(==view)][page7(==view)][page8(==view)][page9(==view)]|", options: [] , metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
      
      case "adultHemlich":
        
        HemlichFirstTime()
        self.title = "ADULTOS"
        let page1 = createAndAddTutorialStep("adultos_drow_2", coachTextName: "1. Si alguien se atraganta y empieza a toser no se debe dar palmadas en la espalda; solo se logra empeorar la obstrucción.")
        let page2 = createAndAddTutorialStep("adultos_drow_3", coachTextName: "2. Dejar que la persona tosa, si tose quiere decir que respira.")
        let page3 = createAndAddTutorialStep("adultos_drow_2", coachTextName: "3. Si la persona empieza a ponerse morada quiere decir que se está atragantando.")
        let page4 = createAndAddTutorialStep("adultos_drow_4", coachTextName: "4. Pararse detrás de la persona y rodearla con los brazos a la altura del ombligo.")
        let page5 = createAndAddTutorialStep("adultos_drow_5", coachTextName: "5. Colocar el puño, con el pulgar hacia la persona en el centro de su abdomen y la otra mano sobre el puño.")
        let page6 = createAndAddTutorialStep("adultos_drow_6", coachTextName: "6. Con un golpe seco y firme, empujar el abdomen de la persona, en un movimiento hacia adentro y hacia arriba.")
        let page7 = createAndAddTutorialStep("adultos_drow_6", coachTextName: "7. Repetir hasta que se resuelva la obstrucción o la persona empiece a marearse.")
        let page8 = createAndAddTutorialStep("adultos_rcp_1", coachTextName: "8. Si se marea colocarlo en el piso y hacer la misma maniobra, pero desde arriba, en vez de por detrás.")
        
        pages = [page1, page2, page3, page4, page5, page6, page7, page8 ]
        pageControl.numberOfPages = 8
        
        let views = ["view": view!, "page1": page1.view!, "page2": page2.view!, "page3": page3.view!, "page4": page4.view!, "page5": page5.view!, "page6": page6.view!, "page7": page7.view!, "page8": page8.view!]
        
        let horizontalConstraints =
          NSLayoutConstraint.constraints( withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)][page5(==view)][page6(==view)][page7(==view)][page8(==view)]|", options: [] , metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
      
      case "teenHemlich":
        
        HemlichFirstTime()
        self.title = "NIÑOS"
        let page1 = createAndAddTutorialStep("nino_drow_1", coachTextName: "1. Dejar que el niño tosa; si tose quiere decir que respira.")
        let page2 = createAndAddTutorialStep("nino_drow_2", coachTextName: "2. Si empieza a ponerse morado quiere decir que se está atragantando.")
        let page3 = createAndAddTutorialStep("nino_drow_3", coachTextName: "3. Arrodillarse detrás del niño para estar a su altura y rodearlo con los brazos a la altura ombligo.")
        let page4 = createAndAddTutorialStep("nino_drow_4", coachTextName: "4. Colocar el puño arriba del ombligo, con el pulgar hacia la persona en el centro de su abdomen y la otra mano sobre el puño.")
        let page5 = createAndAddTutorialStep("nino_drow_5", coachTextName: "5. Con un golpe seco y firme, empujar el abdomen del niño, en un movimiento hacia adentro y hacia arriba.")
        let page6 = createAndAddTutorialStep("nino_drow_6", coachTextName: "6. Repetir hasta que se resuelva la obstrucción, aumentando la intensidad del apretón cada vez.")
        let page7 = createAndAddTutorialStep("nino_rcp_1", coachTextName: "7. Si el niño queda inconsciente iniciar la maniobra de RCP.")
        
        pages = [page1, page2, page3, page4, page5, page6, page7 ]
        pageControl.numberOfPages = 7
        
        let views = ["view": view!, "page1": page1.view!, "page2": page2.view!, "page3": page3.view!, "page4": page4.view!, "page5": page5.view!, "page6": page6.view!, "page7": page7.view!]
        
        let horizontalConstraints =
          NSLayoutConstraint.constraints( withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)][page5(==view)][page6(==view)][page7(==view)]|", options: [] , metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
      
      case "babyHemlich":
        
        HemlichFirstTime()
        self.title = "BEBES"
        let page1 = createAndAddTutorialStep("bebe_drow_1", coachTextName: "1. Si el niño empieza a toser incentivarlo a que siga.")
        let page2 = createAndAddTutorialStep("bebe_drow_2", coachTextName: "2. Si vemos que la tos es cada vez menor y el niño necesita ayuda realice la siguiente maniobra.")
        let page3 = createAndAddTutorialStep("bebe_drow_3", coachTextName: "3. Sujete al niño por la mandíbula y colóquelo boca abajo sobre su antebrazo, con la cabeza más abajo que los pies.")
        let page4 = createAndAddTutorialStep("bebe_drow_4", coachTextName: "4. Con el talón de la mano darle 5 golpes fuertes y secos entre los omóplatos.")
        let page5 = createAndAddTutorialStep("bebe_drow_5", coachTextName: "5. Sujetando al niño por la cabeza, girarlo boca arriba manteniendo el mismo ángulo.")
        let page6 = createAndAddTutorialStep("bebe_drow_5", coachTextName: "6. Realizar 5 compresiones torácicas, con dos dedos en el centro del pecho a la altura de la tetilla,  fuertes y espaciadas en tiempo.")
        let page7 = createAndAddTutorialStep("bebe_drow_6", coachTextName: "7. Colocar al niño sobre la mesa y examinar su boca.")
        let page8 = createAndAddTutorialStep("bebe_drow_7", coachTextName: "8. Si el cuerpo extraño es visible fácilmente removerlo con un dedo.")
        let page9 = createAndAddTutorialStep("bebe_drow_7", coachTextName: "9. Si no es visible repetir el procedimiento hasta que salga la obstrucción o el niño quede inconsciente.")
        
        pages = [page1, page2, page3, page4, page5, page6, page7, page8, page9 ]
        pageControl.numberOfPages = 9
        
        let views = ["view": view!, "page1": page1.view!, "page2": page2.view!, "page3": page3.view!, "page4": page4.view!, "page5": page5.view!, "page6": page6.view!, "page7": page7.view!, "page8": page8.view!, "page9": page9.view!]
        
        let horizontalConstraints =
          NSLayoutConstraint.constraints( withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)][page5(==view)][page6(==view)][page7(==view)][page8(==view)][page9(==view)]|", options: [] , metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
      
      default:  print("Todo MAL")
      
    }
    
  }
  
  func RCPFirstTime() {
    if userDefaults.bool(forKey: "isRCPFirstTime") == true {
//      print("RCP First time running RCP, Display CoachMark & change Bool value")
//      isRCPFirstTime = false
      userDefaults.set(false, forKey: "isRCPFirstTime")
    } else {
//      print("Hide CoachMark")
      CoachMarkBackground.isHidden = true
      CoachMarkText.isHidden = true
      CoachMarkImage.isHidden = true
    }
  }
  
  func HemlichFirstTime() {
    if userDefaults.bool(forKey: "isHemlichFirstTime") == true {
//      print("RCP First time running RCP, Display CoachMark & change Bool value")
//      isHemlichFirstTime = false
      userDefaults.set(false, forKey: "isHemlichFirstTime")
    } else {
//      print("Hide CoachMark")
      CoachMarkBackground.isHidden = true
      CoachMarkText.isHidden = true
      CoachMarkImage.isHidden = true
    }
  }
  
  func setScrollBarHidden() {
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.showsVerticalScrollIndicator = false
    scrollView.isPagingEnabled = true
    
    scrollView.delegate = self
  }
  
//  func setNavigationBarColor() {
//    navigationController!.navigationBar.translucent = true
//    navigationController!.navigationBar.barTintColor = backToGround
//  }
  
  override func viewWillDisappear(_ animated: Bool) {
//    setNavigationBarColor()
    removeFromParentViewController()
  }
  
  
}


extension SliderVC {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageWidth = scrollView.bounds.width
    let pageFraction = scrollView.contentOffset.x / pageWidth
    
    pageControl.currentPage = Int(round(pageFraction))
    CoachMarkBackground.isHidden = true
    CoachMarkText.isHidden = true
    CoachMarkImage.isHidden = true
  }
  
  
}
