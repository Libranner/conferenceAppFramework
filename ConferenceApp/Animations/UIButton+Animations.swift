//
//  UIButton+Animations.swift
//  TsaChat1819
//
//  Created by Clary Morla Gomez on 11/02/2019.
//  Copyright © 2019 Marro Gros Gabriel. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    func slidingInWithDelay(delay: TimeInterval = 0.3){
        
        self.transform = CGAffineTransform(translationX: +self.bounds.size.width, y: 0)
        self.alpha = 0
        
        UIButton.animate(withDuration: 0.6, delay: delay,
                         options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity
            self.alpha = 1
        }, completion: nil)
    }
    
    func slidingIn(){
        
        self.transform = CGAffineTransform(translationX: +self.bounds.size.width, y: 0)
        self.alpha = 0
        
        UIButton.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity
            self.alpha = 1
        }, completion: nil)
    }
    
    func slidingOutWithDelay(){
        
        UIButton.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(translationX: -self.bounds.size.width, y: 0)
            self.alpha = 0
        }, completion: nil)
    }
    
    func slidingOut(){
        
        UIButton.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(translationX: -self.bounds.size.width, y: 0)
            self.alpha = 0
        }, completion: nil)
    }
    
    func scaleSend(){ //animates the Send button
        
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.duration = 0.3
        scale.fromValue = 1.0
        scale.toValue = 1.5
        scale.autoreverses = true
        
        layer.add(scale, forKey: "nil")
    }
    
    func pulse(){
        
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.duration = 0.2
        animation.fromValue = 1.0
        animation.toValue = 1.1
        animation.autoreverses = true
        
        layer.add(animation, forKey: "nil")
        
    }
    
}
