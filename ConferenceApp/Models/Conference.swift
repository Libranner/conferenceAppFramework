//
//  Conference.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

struct Conference {
  var name: String
  var details: String
  var logoPath: URL
  var startDate: Date
  var endDate: Date
  var venue : [Venue]
  var tracks: [Track]
  var speakers: [Speaker]
  var participants: [Participant]
}
