//
//  PlaceView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class PlaceView: UIView {
  fileprivate lazy var photoImageView: AsyncImageView = {
    let photoImageView = AsyncImageView()
    photoImageView.contentMode = .scaleAspectFit
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    return photoImageView
  }()
  
  fileprivate lazy var nameLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.textColor = .white
    label.minimumScaleFactor = 0.7
    return label
  }()
  
  fileprivate lazy var dateLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = CustomColor.defaultColor
    return label
  }()
  
  fileprivate lazy var detailLabel: UILabel = {
    let label = UIHelper.multiLineLabel()
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .darkGray
    return label
  }()
  
  fileprivate lazy var navigationButton: RoundedButton = {
    let button = UIHelper.simpleButton()
    button.setBackgroundImage(UIImage(named: "navigation"), for: .normal)
    return button
  }()
  
  fileprivate lazy var gradientView: GradientView = {
    let view = GradientView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, dateLabel, detailLabel])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 15
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    return stackView
  }()
  
  fileprivate lazy var mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(gradientView)
    scrollView.addSubview(photoImageView)
    scrollView.addSubview(navigationButton)
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
      
      navigationButton.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -50),
      navigationButton.rightAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: -30),
      navigationButton.widthAnchor.constraint(equalToConstant: 50),
      navigationButton.heightAnchor.constraint(equalTo: navigationButton.widthAnchor),
      
      mainStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -30),
      mainStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
      mainStackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
      mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20)
      ])
  }
  
  var placeName: String? {
    didSet {
      nameLabel.text = placeName
    }
  }
  
  var placeDetail: String? {
    didSet {
      detailLabel.text = placeDetail
    }
  }
  
  var formattedDate: String? {
    didSet {
      guard let formattedDate = formattedDate else {
        dateLabel.isHidden = true
        return
      }
      dateLabel.text = formattedDate
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
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
