//
//  Session.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

struct Session {
  var name: String
  var details: String
  var startDate: Date
  var endDate: Date
  var picture: URL?
  var talks: [Talk]?
  var workshops: [Workshop]?
  
  var formattedDate: String {
    return "\(DateHelper.dateToString(startDate)) - \(DateHelper.dateToString(endDate))"
  }
}
