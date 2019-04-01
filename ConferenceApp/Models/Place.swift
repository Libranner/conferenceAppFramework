//
//  Place.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

class Place {
  var name: String
  var direction: String
  var latitude: Float
  var longitude: Float
  
  init(name: String, direction: String, latitude: Float, longitude: Float) {
    self.name = name
    self.direction = direction
    self.latitude = latitude
    self.longitude = longitude
  }
}
