//
//  Loader.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

struct Loader {
//Ejemplo
  static func load() {
    let conference = Conference(name: "", details: "")
    
    for conference.tracks {
      conference.tracks.append(Track())
    }
  }

}
