//
//  ReviewView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 14/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class ReviewView: UIView {

  private func setupLayout() {

    let stackView = UIStackView()
    
    [("😀", CustomColor.greenColor), ("😐", CustomColor.blueColor), ("☹️", CustomColor.redColor)].forEach { (option) in
      let button = setupButtonWithTitle(option.0)
      button.backgroundColor = option.1
      stackView.addArrangedSubview(button)
    }
    
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 30
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
      ])
  }
  
  fileprivate func setupButtonWithTitle(_ title: String) -> UIButton {
    let button = UIHelper.roundedButton()
    button.setTitle(title, for: .normal)
    button.backgroundColor = CustomColor.defaultColor
    button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
    
    NSLayoutConstraint.activate([
      button.heightAnchor.constraint(equalToConstant: 100),
      button.widthAnchor.constraint(equalToConstant: 100)
      ])
    
    return button
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
