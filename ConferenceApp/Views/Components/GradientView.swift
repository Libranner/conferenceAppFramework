//
//  GradientView.swift
//  ZTrips
//
//  Created by Libranner Leonel Santos Espinal on 16/01/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class GradientView: UIView {
  
  lazy fileprivate var gradientLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.65).cgColor]
    layer.locations = [NSNumber(value: 0.5 as Float), NSNumber(value: 1.0 as Float)]
    return layer
  }()

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.clear
    layer.addSublayer(gradientLayer)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
  }
  
}
