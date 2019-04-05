//
//  Talk.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class Talk: Activity {
  var canAsk: Bool = false
  
  convenience init(name: String, details: String, startDate: Date, endDate: Date, speaker: Speaker?,
                   room: Room?, participants: [Participant]?, canReview: Bool, canAsk: Bool) {
    
    self.init(name: name, details: details, startDate: startDate, endDate: endDate,
              speaker: speaker, room: room, participants: participants, canReview: canReview)
    
    self.canAsk = canAsk
  }
}
