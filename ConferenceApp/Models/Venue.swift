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
  var rooms: [Room]?
  
  init(name: String, direction: String, latitude: Float, longitude: Float, photoURL: URL?) {
    super.init(name: name, direction: direction, latitude: latitude, longitude: longitude)
    self.photoURL = photoURL
  }
  
  func roomWithName(_ name: String) -> Room? {
    guard let rooms = rooms else{
      return nil
    }
    
    return rooms.first { (v) -> Bool in
      v.name == name
    }
  }
}
