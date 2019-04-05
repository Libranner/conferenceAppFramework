//
//  ConferenceViewCongtrollerViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 05/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class ConferenceViewController: UIViewController, CustomTableViewControllerDelegate {
  
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

    title = "Welcome!"
    view.addSubview(conferenceView)
    
    NSLayoutConstraint.activate([
      conferenceView.topAnchor.constraint(equalTo: view.topAnchor),
      conferenceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      conferenceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      conferenceView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    
    conferenceView.tracksButton.addTarget(self, action: #selector(showTracksPressed),
                                          for: .touchUpInside)
  }
  
  @objc func showTracksPressed() {
    var data = [TableViewData]()
    
    let conference = Loader.shared.conferenceData()
    conference.tracks?.forEach({ (track) in
      data.append(TableViewData(title: track.name, subtitle:"", imagePath: nil, object: track as AnyObject))
    })
    
    let vc = CustomTableViewController(style: .plain, data: ["": data])
    vc.customTableViewControllerDelegate = self
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func cellSelected(object: AnyObject?) {
    guard let object = object else {
      return
    }
    let track = object as! Track
    
    var data = [TableViewData]()
    track.sessions?.forEach({ (session) in
      let formattedDate = "\(DateHelper.dateToString(session.startDate)) - \(DateHelper.dateToString(session.endDate))"
      data.append(TableViewData(title: session.name, subtitle:formattedDate, imagePath: session.picture, object: session as AnyObject))
    })
    
    let vc = CustomTableViewController(style: .plain, data: ["": data])
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
