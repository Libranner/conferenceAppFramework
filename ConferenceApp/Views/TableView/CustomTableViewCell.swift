//
//  CustomTableViewCell.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  fileprivate lazy var photoImageView: AsyncImageView = {
    let photoImageView = AsyncImageView()
    photoImageView.contentMode = .scaleAspectFill
    photoImageView.clipsToBounds = true
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    return photoImageView
  }()
  
  fileprivate lazy var titleLabel: UILabel = {
    let label = UIHelper.multiLineLabel()
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = .white
    label.minimumScaleFactor = 0.7
    return label
  }()
  
  fileprivate lazy var subtitleLabel: UILabel = {
    let label = UIHelper.singleLineLabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = .white
    return label
  }()
  
  fileprivate lazy var gradientView: GradientView = {
    let view = GradientView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var dataStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 5
    stackView.translatesAutoresizingMaskIntoConstraints =  false
    return stackView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) not implemented")
  }
  
  private func setupUI() {
    contentView.backgroundColor = CustomColor.defaultColor
    contentView.addSubview(photoImageView)
    contentView.addSubview(gradientView)
    contentView.addSubview(dataStackView)
    
    NSLayoutConstraint.activate([
      photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      photoImageView.heightAnchor.constraint(equalToConstant: 100),
      
      gradientView.topAnchor.constraint(equalTo: photoImageView.topAnchor),
      gradientView.rightAnchor.constraint(equalTo: photoImageView.rightAnchor),
      gradientView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
      gradientView.leftAnchor.constraint(equalTo: photoImageView.leftAnchor),
      
      dataStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      dataStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
      dataStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
      ])
  }
  
  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }
  
  var subtitle: String? {
    didSet {
      subtitleLabel.text = subtitle
    }
  }
  
  var photoImageUrl: URL? {
    didSet {
      photoImageView.fillWithURL(photoImageUrl, placeholder: nil)
    }
  }
  
}
