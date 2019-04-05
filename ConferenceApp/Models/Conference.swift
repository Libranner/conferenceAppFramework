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
  var logoPath: URL?
  var startDate: Date
  var endDate: Date
  var venues : [Venue]?
  var tracks: [Track]?
  var speakers: [Speaker]?
  var participants: [Participant]?
  var socialFeeds: [SocialFeed]? = nil
  
  func venueWithName(_ name: String) -> Venue? {
    return venues?.first { (v) -> Bool in
      v.name == name
    }
  }
  
  func roomWithName(_ name: String) -> Room? {
    var room: Room? = nil
    
    venues?.forEach({ (v) in
      let result = v.roomWithName(name)
      if result != nil {
        room = result
        return
      }
    })
    
    return room
  }
  
  func speakerWithName(_ name: String) -> Speaker? {
    return speakers?.first { (v) -> Bool in
      v.name == name
    }
  }
  
  func trackWithName(_ name: String) -> Track? {
    return tracks?.first { (v) -> Bool in
      v.name == name
    }
  }
  
  func participantWithName(_ name: String) -> Participant? {
    return participants?.first { (v) -> Bool in
      v.name == name
    }
  }  
  
  mutating func addVenue(_ venue: Venue) {
    let existingVenue = venues?.first { (v) -> Bool in
      v.name == venue.name
    }
    
    guard existingVenue == nil else {
      return
    }
    
    venues?.append(venue)
  }
  
  mutating func addTrack(_ track: Track) -> Track {
    
    let existingTrack = tracks?.first { (v) -> Bool in
      v.name == track.name
    }
    
    guard existingTrack == nil else {
      return existingTrack!
    }
    
    tracks?.append(track)
    return track
  }
  
  mutating func addSpeaker(_ speaker: Speaker) -> Speaker {
    
    let existingSpeaker = speakers?.first { (v) -> Bool in
      v.name == speaker.name
    }
    
    guard existingSpeaker == nil else {
      return existingSpeaker!
    }
    
    speakers?.append(speaker)
    return speaker
  }
  
  mutating func addParticipant(_ participant: Participant) -> Participant {
    
    let existingParticipant = participants?.first { (v) -> Bool in
      v.name == participant.name
    }
    
    guard existingParticipant == nil else {
      return existingParticipant!
    }
    
    participants?.append(participant)
    return participant
  }
}
