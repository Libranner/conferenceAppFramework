//
//  QuestionView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 01/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class QuestionView: UIView {
  
  fileprivate lazy var questionTextField: UITextField = {
    let textfield = UITextField(frame: .zero)
    textfield.borderStyle = .roundedRect
    textfield.translatesAutoresizingMaskIntoConstraints = false
    return textfield
  }()
  
  fileprivate lazy var askButton: RoundedButton = {
    let button = UIHelper.simpleButton()
    //button.setBackgroundImage(UIImage(named: "ask"), for: .normal)
    button.setTitle("Preguntar", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private func setupLayout() {
    self.addSubview(questionTextField)
    self.addSubview(askButton)
    
    NSLayoutConstraint.activate([
      questionTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -100),
      questionTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      questionTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
      questionTextField.heightAnchor.constraint(equalToConstant: 40),
      
      askButton.centerXAnchor.constraint(equalTo: questionTextField.centerXAnchor),
      askButton.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 30),
      askButton.heightAnchor.constraint(equalToConstant: 40),
      askButton.widthAnchor.constraint(equalTo: questionTextField.widthAnchor)
      ])
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

