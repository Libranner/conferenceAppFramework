//
//  ShakeAnimation.swift
//  TsaChat1819
//
//  Created by Clary Morla Gomez on 04/02/2019.
//  Copyright © 2019 Marro Gros Gabriel. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIView{
  
  func shakeAnimation(){  //this explains itself
    
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.05
    animation.repeatCount = 8
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
    
    self.layer.add(animation, forKey: "position")
  }
  
  func bottomViewAnimation(){ //this one appears another view from bottom to top pero que ya esta abajo
    
    UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
      self.transform = CGAffineTransform(translationX: 0, y: -self.bounds.size.height)
    }) { (true) in
    }
  }
  
  func viewAnimate() { //this one appears the view from bottom to top
    self.transform = CGAffineTransform(translationX: 0, y: +self.bounds.size.height )
    
    UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
      self.transform = CGAffineTransform.identity
    }, completion: nil)
  }
  
  func aboutAnimate() { //animates from bottom to top with a spring 
    self.transform = CGAffineTransform.init(translationX: 0, y: +self.bounds.size.height )
    self.alpha = 0
    
    UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
      self.transform = CGAffineTransform.identity
      self.alpha = 1
    }, completion: nil)
  }
  
  func chatBubble(){
    self.transform = CGAffineTransform(scaleX: 0, y: 1)
    UIView.animate(withDuration: 1.0, animations: {
      self.transform = CGAffineTransform.identity
    }, completion: nil)
  }
  
  func changeColorAnimated(_ color: UIColor){ //change the background color of a view with an animation
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
      self.backgroundColor = color
    }, completion: nil)
  }
  
  func infoViewProperties(){
    self.layer.cornerRadius = 5
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.borderWidth = 1
  }
  
  func heartbeat(){
    
    let animation = CABasicAnimation(keyPath: "transform.scale")
    animation.duration = 0.5
    animation.fromValue = 1.0
    animation.toValue = 1.1
    animation.autoreverses = true
    animation.repeatCount = HUGE
    
    layer.add(animation, forKey: "transform.scale")
  }
}



