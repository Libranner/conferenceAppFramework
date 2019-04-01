//
//  CustomTableView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

  override convenience init(frame: CGRect, style: UITableView.Style) {
    self.init(frame: frame, style: style)
    setup()
  }
  
  fileprivate func setup(){
    self.separatorStyle = .none
    self.allowsSelection = true
    self.allowsMultipleSelection = false
    self.translatesAutoresizingMaskIntoConstraints = false
    self.estimatedRowHeight = 1
  }
  
}
