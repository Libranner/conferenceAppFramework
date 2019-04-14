//
//  SpeakerView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class SpeakerView: UIView {
  
  fileprivate lazy var photoImageView: AsyncImageView = {
    let photoImageView = AsyncImageView()
    photoImageView.contentMode = .scaleToFill
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    return photoImageView
  }()
  
  fileprivate lazy var nameLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.textAlignment = .center
    label.minimumScaleFactor = 0.7
    return label
  }()
  
  fileprivate lazy var bioLabel: UILabel = {
    let label = UIHelper.multiLineLabel()
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .darkGray
    return label
  }()
    
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 15
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    return stackView
  }()
  
  fileprivate lazy var mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(photoImageView)
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
      
      photoImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 30),
      photoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor),
      photoImageView.heightAnchor.constraint(equalToConstant: imageWidth),
      
      mainStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
      mainStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      mainStackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
      mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20)
      ])
  }
  
  fileprivate var imageWidth: CGFloat {
    return UIScreen.main.bounds.width * 0.6
  }
  
  var speakerName: String? {
    didSet {
      nameLabel.text = speakerName
    }
  }
  
  var speakerBio: String? {
    didSet {
      bioLabel.text = speakerBio
    }
  }
  
  var speakerImageUrl: URL? {
    didSet {
      photoImageView.fillWithURL(speakerImageUrl, placeholder: "logo_usj")
      photoImageView.layer.borderWidth = 2
      photoImageView.layer.borderColor = CustomColor.defaultColor.cgColor
      photoImageView.clipsToBounds = true
      photoImageView.contentMode = .scaleAspectFill
      photoImageView.layer.cornerRadius = imageWidth / 2
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
