//
//  SocialFeed.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

enum SocialNetwork {
  case facebook
  case twitter
  case instagram
}

struct SocialFeed {
  var hashtag: String
  var socialNetwork: SocialNetwork
}
