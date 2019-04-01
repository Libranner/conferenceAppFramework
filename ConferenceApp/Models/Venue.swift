//
//  Venue.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

class Venue: Place {
  var photoURL: URL?
  
  init(name: String, direction: String, latitude: Float, longitude: Float, photoURL: URL?) {
    super.init(name: name, direction: direction, latitude: latitude, longitude: longitude)
    self.photoURL = photoURL
  }
}
