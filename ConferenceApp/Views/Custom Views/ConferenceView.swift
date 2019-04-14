//
//  ConferenceView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 05/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

protocol ConferenceViewDelegate {
  func showTracksPressed()
}

class ConferenceView:  UIView {
  var delegate: ConferenceViewDelegate?
  
  fileprivate lazy var photoImageView: AsyncImageView = {
    let photoImageView = AsyncImageView()
    photoImageView.contentMode = .scaleAspectFit
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    return photoImageView
  }()
  
  fileprivate lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.minimumScaleFactor = 0.7
    return label
  }()
  
  fileprivate lazy var detailLabel: UILabel = {
    let label = UIHelper.multiLineLabel()
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .darkGray
    return label
  }()
  
  fileprivate lazy var gradientView: GradientView = {
    let view = GradientView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, detailLabel])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 15
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    return stackView
  }()
  
  fileprivate lazy var mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(photoImageView)
    scrollView.addSubview(gradientView)
    scrollView.addSubview(mainStackView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private func setupLayout() {
    self.addSubview(mainScrollView)
    
    NSLayoutConstraint.activate([
      mainScrollView.topAnchor.constraint(equalTo: topAnchor),
      mainScrollView.rightAnchor.constraint(equalTo: rightAnchor),
      mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      mainScrollView.leftAnchor.constraint(equalTo: leftAnchor),
      
      photoImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
      photoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      photoImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
      photoImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45),
      
      gradientView.topAnchor.constraint(equalTo: photoImageView.topAnchor),
      gradientView.rightAnchor.constraint(equalTo: photoImageView.rightAnchor),
      gradientView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
      gradientView.leftAnchor.constraint(equalTo: photoImageView.leftAnchor),
      
      mainStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -30),
      mainStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
      mainStackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
      mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: 20)
      ])
  }
  
  var name: String? {
    didSet {
      nameLabel.text = name
    }
  }
  
  var detail: String? {
    didSet {
      detailLabel.text = detail
    }
  }
  
  var photoImageUrl: URL? {
    didSet {
      photoImageView.fillWithURL(photoImageUrl, placeholder: "logo_usj")
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    self.init()
  }
}

