//
//  ContentViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 05/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

  var containerView: UIView!
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
    setupLayout()
  }
  
  fileprivate func setupLayout() {
    view.backgroundColor = .white
    
    containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(containerView)
    
    let closeButton = UIHelper.roundedButton()
    closeButton.setTitle("X", for: .normal)
    closeButton.setTitleColor(.white, for: .normal)
    closeButton.backgroundColor = UIColor.gray
    closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    
    view.addSubview(closeButton)
    
    NSLayoutConstraint.activate([
      closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      closeButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
      closeButton.widthAnchor.constraint(equalToConstant: 40),
      closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
      
      containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @objc fileprivate func close() {
    dismiss(animated: true, completion: nil)
  }
  
}
