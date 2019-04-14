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
      
      let talksVC = CustomTableViewController(style: .plain, data: ["Talks": talks, "Workshops": workshops], onSelected: nil)
      self?.navigationController?.pushViewController(talksVC , animated: true)
    }
    
    self.navigationController?.pushViewController(vc , animated: true)
  }
}
