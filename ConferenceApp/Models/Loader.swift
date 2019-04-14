//
//  Loader.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 13/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import Foundation

struct Loader {
  
  
  
  static let shared = Loader()
  
  func conferenceData() -> Conference {
    return load()
  }
  
  
  
  fileprivate func load() -> Conference {
    
    var conference = Conference(name: "Healthy Lifestyle 2019", details: "Conferencia sobre nutrición para un estilo de vida saludable",
                                
                                logoPath: URL(string: "https://bit.ly/2YQjWJb"), startDate: convertDateFrom("Mon Apr 15 10:00:00 CEST 2019"),
                                
                                endDate: convertDateFrom("Tue Apr 16 16:00:00 CEST 2019"), venues: nil, tracks: nil, speakers: nil, participants: nil, socialFeeds : nil)
    
    
    
    conference.tracks = [Track]()
    
    conference.venues = [Venue]()
    
    conference.speakers = [Speaker]()
    
    conference.participants = [Participant]()
    
    conference.socialFeeds = [SocialFeed]()
    
    //INICIO CARGAR SALAS
    
    var venueI : Venue
    
    
    //en venue falta rooms ,  latitud y longitud y foto
    
    venueI = Venue(name: "Palacio de Congresos Zaragoza", direction: "Plaza Lucas Miret Rodriguez, 1, 50018 Zaragoza", latitude: 41.66874, longitude: -0.90643,
                   
                   photoURL: URL(string: "https://bit.ly/2IqxTrQ"))
    
    
    venueI.rooms?.append(Room(name: "Sala 1", direction: "Palacio de Congresos de Zaragoza, Planta 0", latitude: 41.66874, longitude: -0.90643))
    
    
    venueI.rooms?.append(Room(name: "Sala 2", direction: "Palacio de Congresos de Zaragoza, Planta 1", latitude: 41.66874, longitude: -0.90643))
    
    
    conference.addVenue(venueI)
    
    
    //FIN CARGA SALAS
    
    
    
    //INICIO SPEAKER
    
    
    _ = conference.addSpeaker(Speaker(name: "Dr. Carlos Jaramillo", bio: "Medico Naturopata con mas de 30 años de experiencia en el campo de la nutrición saludable", picture: URL(string: "https://bit.ly/2U9S5jQ")))
    
    
    _ = conference.addSpeaker(Speaker(name: "Dra. Claudia Gonzales", bio: "La nutricionista registrada Claudia González se graduó de la Universidad Internacional de Florida bajo la especialidad de Dietética y Nutrición y también tiene una Maestría en Comunicación.", picture: URL(string: "https://bit.ly/2G1cqCH")))
    
    
    
    
    //FIN SPEAKER
    
    //INICIO CARGA SOCIAL FEED
    
    
    conference.socialFeeds?.append(SocialFeed(hashtag: "#HealthyLifeStyle", socialNetwork: SocialNetwork.instagram))
    
    
    conference.socialFeeds?.append(SocialFeed(hashtag: "#HealthyLifeStyle", socialNetwork: SocialNetwork.twitter))
    
    
    //FIN CARGA SOCIAL FEED
    
    
    
    //INICIO CARGA TALK Y WORK
    
    var trackI : Track?
    
    var sessionI : Session?
    
    var workshopI : Workshop?
    
    var talkI : Talk?
    
    
    
    
    trackI = nil
    
    trackI = Track(name: "Healthy Living", sessions : nil)
    trackI?.sessions = [Session]()
    
    sessionI = nil
    
    sessionI = Session(name: "Día 1", details: "Las charlas son orientadas al conocimiento del funcionamiento del organismo", startDate: convertDateFrom("Mon Apr 15 10:00:00 CEST 2019"),
                       
                       endDate: convertDateFrom("Mon Apr 15 16:30:00 CEST 2019"), picture: URL(string: "https://bit.ly/2IpDcYw"), talks: [Talk](), workshops: [Workshop]())
    
    
    talkI  = Talk(name: "El metabolismo", details: "Alimentación correcta, respiración y movimiento", startDate: convertDateFrom("Mon Apr 15 14:30:00 CEST 2019"),
                  
                  endDate: convertDateFrom("Mon Apr 15 16:30:00 CEST 2019"), speaker: nil, room: nil,
                  
                  participants: nil, canReview: true, canAsk: true)
    
    talkI?.room = conference.roomWithName("Sala 1")
    
    talkI?.speaker = conference.speakerWithName("Dr. Carlos Jaramillo")
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Emilia Jimenez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Ernesto Sanchez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Luis Henriquez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Sarah Martinez")))
    
    
    sessionI?.talks?.append(talkI!)
    
    
    
    
    
    
    
    talkI  = Talk(name: "El reloj biologico", details: "El reloj biologico es el dispositivo de tiempo de un organismo y tenemos relojes en cada organo", startDate: convertDateFrom("Mon Apr 15 10:00:00 CEST 2019"),
                  
                  endDate: convertDateFrom("Mon Apr 15 13:00:00 CEST 2019"), speaker: nil, room: nil,
                  
                  participants: nil, canReview: true, canAsk: true)
    
    talkI?.room = conference.roomWithName("Sala 1")
    
    talkI?.speaker = conference.speakerWithName("Dr. Carlos Jaramillo")
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Emilia Jimenez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Ernesto Sanchez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Luis Henriquez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Sarah Martinez")))
    
    
    sessionI?.talks?.append(talkI!)
    
    
    
    
    
    trackI?.sessions?.append(sessionI!)
    
    
    sessionI = nil
    
    sessionI = Session(name: "Día 2", details: "Conoce lo que comes", startDate: convertDateFrom("Tue Apr 16 00:00:00 CEST 2019"),
                       
                       endDate: convertDateFrom("Tue Apr 16 00:00:00 CEST 2019"), picture: URL(string: "https://bit.ly/2UNasiW"), talks: nil, workshops: nil)
    
    
    
    
    talkI  = Talk(name: "Comida Diaria", details: "Aspectos de la comida diaria que afectan el estilo de vida", startDate: convertDateFrom("Tue Apr 16 14:30:00 CEST 2019"),
                  
                  endDate: convertDateFrom("Tue Apr 16 16:00:00 CEST 2019"), speaker: nil, room: nil,
                  
                  participants: nil, canReview: true, canAsk: true)
    
    talkI?.room = conference.roomWithName("Sala 2")
    
    talkI?.speaker = conference.speakerWithName("Dra. Claudia Gonzales")
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Emilia Jimenez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Ernesto Sanchez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Luis Henriquez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Sarah Martinez")))
    
    
    sessionI?.talks?.append(talkI!)
    
    
    
    
    
    
    
    talkI  = Talk(name: "Contenido nutritivo de los vegetales", details: "Phytoquimicos que se encuentran en las plantas", startDate: convertDateFrom("Tue Apr 16 10:00:00 CEST 2019"),
                  
                  endDate: convertDateFrom("Tue Apr 16 13:00:00 CEST 2019"), speaker: nil, room: nil,
                  
                  participants: nil, canReview: true, canAsk: true)
    
    talkI?.room = conference.roomWithName("Sala 2")
    
    talkI?.speaker = conference.speakerWithName("Dr. Carlos Jaramillo")
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Emilia Jimenez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Ernesto Sanchez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Luis Henriquez")))
    
    
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Sarah Martinez")))
    
    
    sessionI?.talks?.append(talkI!)
    
    
    
    
    
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
