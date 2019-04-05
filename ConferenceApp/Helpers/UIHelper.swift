//
//  UIHelpers.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation
import UIKit

struct UIHelper {
  static func singleLineLabel() -> UILabel{
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
  
  static func multiLineLabel() -> UILabel{
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }
  
  static func roundedButton() -> RoundedButton{
    let button = RoundedButton()
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = CustomColor.defaultColor
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
  
  static func normalButton() -> UIButton{
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = CustomColor.defaultColor
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
}
