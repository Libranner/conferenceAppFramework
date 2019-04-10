//
//  DateHelper.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 05/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

struct DateHelper {
  static func dateToString(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat =  "MM/dd/yyyy HH:mm"
    
    return dateFormatter.string(from: date)
  }
}
