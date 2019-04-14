//
//  ConferenceViewCongtrollerViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 05/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class ConferenceViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    load()
  }
  
  func load() {
    let conferenceView = ConferenceView()
    let conference = Loader.shared.conferenceData()
    conferenceView.name = conference.name
    conferenceView.detail = conference.details
    conferenceView.photoImageUrl = conference.logoPath
    conferenceView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(conferenceView)
    
    NSLayoutConstraint.activate([
      conferenceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      conferenceView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      conferenceView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      conferenceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
  }
  
  /*@objc func showTracksPressed() {
    var data = [TableViewData]()
    
    let conference = Loader.shared.conferenceData()
    conference.tracks?.forEach({ (track) in
      data.append(TableViewData(title: track.name, subtitle:"", imagePath: nil, object: track as AnyObject))
    })
    
    let vc = CustomTableViewController(style: .plain, data: ["": data], onSelected: cellSelected)
    navigationController?.pushViewController(vc, animated: true)
  }*/
  
}
