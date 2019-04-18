//
//  SocialFeedTableViewCell.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 13/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class SocialFeedTableViewCell: UITableViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  fileprivate lazy var iconImageView: UIImageView = {
    let photoImageView = UIImageView()
    photoImageView.contentMode = .scaleAspectFill
    photoImageView.clipsToBounds = true
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    return photoImageView
  }()
  
  fileprivate lazy var contentLabel: UILabel = {
    let label = UIHelper.multiLineLabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.minimumScaleFactor = 0.4
    return label
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
    contentView.addSubview(iconImageView)
    contentView.addSubview(contentLabel)
    
    NSLayoutConstraint.activate([
      iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      iconImageView.widthAnchor.constraint(equalToConstant: 30),
      iconImageView.heightAnchor.constraint(equalToConstant: 30),
      
      contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      contentLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
      contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
      ])
  }
  
  var content: String? {
    didSet {
      contentLabel.text = content
    }
  }
  
  var socialNetwork: SocialNetwork {
    didSet {
      if socialNetwork == .facebook {
        iconImageView.image = UIImage(named: "facebook")
      }
      else if socialNetwork == .instagram {
        iconImageView.image = UIImage(named: "instagram")
      }
      else if socialNetwork == .twitter {
        iconImageView.image = UIImage(named: "twitter")
      }
    }
  }
}
