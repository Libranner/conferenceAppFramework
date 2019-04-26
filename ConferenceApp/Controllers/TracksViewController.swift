//
//  TracksViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 13/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class TracksViewController: CustomTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.onSelected = cellSelected
    self.title = "Tracks"
  }
  
  func cellSelected(object: AnyObject?) {
    guard let object = object else {
      return
    }
    let track = object as! Track
    
    var data = [TableViewData]()
    track.sessions?.forEach({ (session) in
      data.append(TableViewData(title: session.name, subtitle:session.formattedDate, imagePath: session.picture, object: session as AnyObject))
    })
    
    let vc = CustomTableViewController(style: .plain, data: ["": data]) { [weak self] object in
      var talks = [TableViewData]()
      let session = object as! Session
      session.talks?.forEach({ (talk) in
        talks.append(TableViewData(title: talk.name, subtitle:talk.formattedDate, imagePath: nil, object: talk as AnyObject))
      })
      
      var workshops = [TableViewData]()
      session.workshops?.forEach({ (workshop) in
        workshops.append(TableViewData(title: workshop.name, subtitle:workshop.formattedDate, imagePath: nil, object: workshop as AnyObject))
      })
      
      var activities = [String: [TableViewData]]()
      if talks.count > 0 {
        activities["Talks"] = talks
      }
      
      if workshops.count > 0 {
        activities["Workshops"] = workshops
      }
      
      let talksVC = CustomTableViewController(style: .plain, data: activities) { [weak self] activity in
        let activityVC = ActivityViewController()
        activityVC.activity = activity as? Activity
        self?.navigationController?.pushViewController(activityVC, animated: true)
      }
      
      talksVC.title = "Actividades"
      self?.navigationController?.pushViewController(talksVC , animated: true)
    }
    vc.title = "Sesiones"
    self.navigationController?.pushViewController(vc , animated: true)
  }
}
