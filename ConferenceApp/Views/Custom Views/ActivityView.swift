//
//  PlaceView.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class ActivityView: UIView {
  let buttonHeight: CGFloat = 30
  
  fileprivate lazy var photoImageView: AsyncImageView = {
    let photoImageView = AsyncImageView()
    photoImageView.contentMode = .scaleAspectFill
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    return photoImageView
  }()
  
  fileprivate lazy var nameLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.numberOfLines = 1
    label.minimumScaleFactor = 0.7
    return label
  }()
  
  fileprivate lazy var dateLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = CustomColor.defaultColor
    return label
  }()
  
  fileprivate lazy var roomLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = CustomColor.defaultColor
    return label
  }()
  
  fileprivate lazy var detailLabel: UILabel = {
    let label = UIHelper.multiLineLabel()
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .darkGray
    return label
  }()
  
  lazy var navigationButton: RoundedButton = {
    let button = UIHelper.roundedButton()
    button.setBackgroundImage(UIImage(named: "navigation"), for: .normal)
    button.backgroundColor = .white
    return button
  }()
  
  lazy var speakerButton: RoundedButton = {
    let button = UIHelper.roundedButton()
    button.setBackgroundImage(UIImage(named: "speaker"), for: .normal)
    button.backgroundColor = .white
    return button
  }()
  
  lazy var reviewButton: RoundedButton = {
    let button = UIHelper.roundedButton()
    button.setBackgroundImage(UIImage(named: "review"), for: .normal)
    button.backgroundColor = .white
    return button
  }()
  
  lazy var askButton: RoundedButton = {
    let button = UIHelper.roundedButton()
    button.setBackgroundImage(UIImage(named: "ask"), for: .normal)
    button.backgroundColor = .white
    return button
  }()
  
  fileprivate lazy var gradientView: GradientView = {
    let view = GradientView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, dateLabel, roomLabel, detailLabel])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 15
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    return stackView
  }()
  
  private lazy var actionStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [navigationButton, speakerButton, reviewButton, askButton])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 25
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    return stackView
  }()
  
  fileprivate lazy var mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(photoImageView)
    scrollView.addSubview(gradientView)
    scrollView.addSubview(actionStackView)
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
      
      actionStackView.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 20),
      actionStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20),
      
      navigationButton.widthAnchor.constraint(equalToConstant: buttonHeight),
      navigationButton.heightAnchor.constraint(equalTo: navigationButton.widthAnchor),
      
      speakerButton.widthAnchor.constraint(equalToConstant: buttonHeight),
      speakerButton.heightAnchor.constraint(equalTo: navigationButton.widthAnchor),
      
      reviewButton.widthAnchor.constraint(equalToConstant: buttonHeight),
      reviewButton.heightAnchor.constraint(equalTo: navigationButton.widthAnchor),
      
      askButton.widthAnchor.constraint(equalToConstant: buttonHeight),
      askButton.heightAnchor.constraint(equalTo: navigationButton.widthAnchor),
      
      mainStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -30),
      mainStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
      mainStackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
      mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20)
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
  
  var room: String? {
    didSet {
      roomLabel.text = room
    }
  }
  
  var canReview: Bool {
    didSet {
      reviewButton.isHidden = !canReview
    }
  }
  
  var canAsk: Bool {
    didSet {
      askButton.isHidden = !canAsk
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
  
  var photoImage: UIImage? {
    didSet {
      photoImageView.image = photoImage
    }
  }
  
  override init(frame: CGRect) {
    self.canReview = false
    self.canAsk = false
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
