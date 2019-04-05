//
//  Loader.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 23/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//


import Foundation

struct Loader {
  
  static let shared = Loader()
  
  func conferenceData() -> Conference {
    return load()
  }
  
  fileprivate func load() -> Conference {
    var conference = Conference(name: "nombre de la conferencia", details: "detalle de la conferencia",
                                logoPath: URL(string: "sin logo"), startDate: convertDateFrom("Mon Apr 01 00:00:00 CEST 2019"),
                                endDate: convertDateFrom("Mon Apr 01 00:00:00 CEST 2019"), venues: nil, tracks: nil, speakers: nil, participants: nil, socialFeeds : nil)
    
    conference.tracks = [Track]()
    conference.speakers = [Speaker]()
    conference.venues = [Venue]()
    conference.participants = [Participant]()
    conference.socialFeeds = [SocialFeed]()
    
    //INICIO CARGAR SALAS
    var venueI : Venue
    //en venue falta rooms ,  latitud y longitud y foto
    venueI = Venue(name: "nombre venue 1", direction: "direccion venue 1", latitude: 1.0, longitude: 2.0,
                   photoURL: URL(string: "sin imagen"))
    venueI.rooms?.append(Room(name: "nombre room 1", direction: "direccion room 1", latitude: 0.0, longitude: 0.0))
    venueI.rooms?.append(Room(name: "nombre room 2", direction: "direccion room 2", latitude: 0.0, longitude: 0.0))
    conference.addVenue(venueI)
    //FIN CARGA SALAS
    
    //INICIO SPEAKER
    _ = conference.addSpeaker(Speaker(name: "spea1", bio: "bio spea1", picture: URL(string: "sin imagen")))
    _ = conference.addSpeaker(Speaker(name: "spea2", bio: "bio speak2", picture: URL(string: "sin imagen")))
    
    
    //FIN SPEAKER
    //INICIO CARGA SOCIAL FEED
    conference.socialFeeds?.append(SocialFeed(hashtag: "socialfacebook", socialNetwork: SocialNetwork.facebook))
    //FIN CARGA SOCIAL FEED
    
    //INICIO CARGA TALK Y WORK
    var trackI : Track?
    var sessionI : Session?
    var workshopI : Workshop?
    var talkI : Talk?
    
    trackI = nil
    trackI = Track(name: "Nombre Track", sessions : nil)
    trackI?.sessions = [Session]()
    
    sessionI = nil
    sessionI = Session(name: "Nombre sesion", details: "Detalles sesion", startDate: convertDateFrom("Fri Apr 05 00:00:00 CEST 2019"),
                       endDate: convertDateFrom("Fri Apr 05 00:00:00 CEST 2019"), picture: URL(string: "sin imagen"), talks: nil, workshops: nil)
    talkI  = Talk(name: "talk 1", details: "detalle talk", startDate: convertDateFrom("Fri Apr 05 00:00:00 CEST 2019"),
                  endDate: convertDateFrom("Fri Apr 05 00:00:00 CEST 2019"), speaker: nil, room: nil,
                  participants: nil, canReview: true, canAsk: true)
    talkI?.room = conference.roomWithName("nombre room 1")
    talkI?.speaker = conference.speakerWithName("spea1")
    talkI?.participants?.append(conference.addParticipant(Participant(name: "participante 1")))
    sessionI?.talks?.append(talkI!)
    workshopI  = Workshop(name: "nombre workshop 1", details: "detalle workshop",
                          startDate: convertDateFrom("Fri Apr 05 00:00:00 CEST 2019"), endDate: convertDateFrom("Fri Apr 05 00:00:00 CEST 2019"),
                          speaker: nil, room: nil, participants: nil, canReview: false)
    workshopI?.room = conference.roomWithName("nombre room 2")
    workshopI?.speaker = conference.speakerWithName("spea2")
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "participante 2")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "participante 3")))
    sessionI?.workshops?.append(workshopI!)
    trackI?.sessions?.append(sessionI!)
    conference.tracks?.append(trackI!)
    //FIN CARGA TALK Y WORK
    
    return conference
  }
  
  
  func convertDateFrom(_ dateString: String) -> Date{
    let data = dateString.split(separator: " ")
    let finalDate = "\(data[0]) \(data[1]) \(data[2]) \(data[3]) UTC \(data[5])"
    
    let dateFormatter = DateFormatter()
    //dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
    dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss z yyyy"
    return dateFormatter.date(from: finalDate)!
  }
}



