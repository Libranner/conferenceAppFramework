//
//  Activity.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class Activity {
  var name: String
  var details: String
  var startDate: Date
  var endDate: Date
  var canReview: Bool
  var speaker: Speaker
  var room: Room
  var participants: [Participant]
  
  init(name: String, details: String, startDate: Date, endDate: Date,
       speaker: Speaker, room: Room, participants: [Participant], canReview: Bool) {
    self.name = name
    self.details = details
    self.startDate = startDate
    self.endDate = endDate
    self.speaker = speaker
    self.room = room
    self.participants = participants
    self.canReview = canReview
  }
}
