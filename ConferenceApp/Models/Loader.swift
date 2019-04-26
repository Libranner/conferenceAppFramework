import Foundation

struct Loader {
  
  static let shared = Loader()
  
  func conferenceData() -> Conference {
    return load()
  }
  
  fileprivate func load() -> Conference {
    var conference = Conference(name: "Desarrollo dirigido por Modelos", details: "Ensamblado, Modelado y Compilación ",
                                logoPath: URL(string: "https://bit.ly/2UpX9pf"), startDate: convertDateFrom("Wed Apr 24 09:00:00 CEST 2019"),
                                endDate: convertDateFrom("Fri Apr 26 14:00:00 CEST 2019"), venues: nil, tracks: nil, speakers: nil, participants: [Participant](), socialFeeds : nil)
    
    conference.tracks = [Track]()
    conference.venues = [Venue]()
    conference.speakers = [Speaker]()
    conference.participants = [Participant]()
    conference.socialFeeds = [SocialFeed]()
    
    
    
    //INICIO CARGAR SALAS
    var venueI : Venue
    venueI = Venue(name: "Universidad San Jorge", direction: "Autovía Mudéjar, km. 299, 50830 Villanueva de Gállego, Zaragoza", latitude: 41.755894, longitude: -0.8337806,
                   photoURL: URL(string: "https://bit.ly/2D7vcbc"))
    venueI.rooms?.append(Room(name: "Aula 6.1", direction: "Edificio de Estudiantes, Planta 0, USJ", latitude: 41.755756, longitude: -0.83306))
    venueI.rooms?.append(Room(name: "Aula 112", direction: "Escuela de Arquitectura y Tecnología Planta 1, USJ", latitude: 41.756855, longitude: -0.832464))
    venueI.rooms?.append(Room(name: "Aula 113 B", direction: "Edificio de Salud 1, Planta 1, USJ", latitude: 41.757206, longitude: -0.831869))
    conference.addVenue(venueI)
    
    //FIN CARGA SALAS
    
    //INICIO SPEAKER
    _ = conference.addSpeaker(Speaker(name: "Carlos Cetina", bio: "Hi, I’m Carlos Cetina. I do research in Variability-intensive Software System and push it to Industrial settings. Research findings have enriched my lectures at Universidad San Jorge and my hope is that they will do the same for my PhD students.", picture: URL(string: "http://carloscetina.com/img/Cetina-color.png")))
    _ = conference.addSpeaker(Speaker(name: "Charlin Agramonte", bio: "I'm Charlin Agramonte, from Dominican Republic. Co-Founder of CrossGeeks. I have 5+ years of experience in .NET, developing in Xamarin Forms since it started (in 2014). Currently Xamarin Certified Developer and Microsoft MVP.", picture: URL(string: "https://bit.ly/2G5c8Li")))
    _ = conference.addSpeaker(Speaker(name: "Jaime Font", bio: "PhD ,Professor en Universidad San Jorge", picture: URL(string: "https://bit.ly/2VwCxIi")))
    //FIN SPEAKER
    
    //INICIO CARGA SOCIAL FEED
    conference.socialFeeds?.append(SocialFeed(hashtag: "#welovemodels", socialNetwork: SocialNetwork.instagram))
    //FIN CARGA SOCIAL FEED
    
    //INICIO CARGA TALK Y WORK
    var trackI : Track?
    var sessionI : Session?
    var workshopI : Workshop?
    var talkI : Talk?
    trackI = nil
    trackI = Track(name: "Main", sessions : nil)
    trackI?.sessions = [Session]()
    
    sessionI = nil
    sessionI = Session(name: "Sesion 1", details: "Introducción a modelado", startDate: convertDateFrom("Wed Apr 24 09:00:00 CEST 2019"),
                       endDate: convertDateFrom("Wed Apr 24 00:00:00 CEST 2019"), picture: URL(string: "https://bit.ly/2uWmfN4"), talks: [Talk](), workshops: [Workshop]())
    talkI  = Talk(name: "Que son los modelos", details: "Introducción y conceptos", startDate: convertDateFrom("Fri Apr 26 09:00:00 CEST 2019"),
                  endDate: convertDateFrom("Wed Apr 24 11:30:00 CEST 2019"), speaker: nil, room: nil,
                  participants: [Participant](), canReview: true, canAsk: true)
    talkI?.room = conference.roomWithName("Aula 112")
    talkI?.speaker = conference.speakerWithName("Carlos Cetina")
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Clary")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Jose Ignacio")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Libranner")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Milan")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Roger")))
    sessionI?.talks?.append(talkI!)
    workshopI  = Workshop(name: "Eclipse Modeling Framework", details: "Introddución a Eclipse, Definicion del proyecto",
                          startDate: convertDateFrom("Wed Apr 24 12:00:00 CEST 2019"), endDate: convertDateFrom("Wed Apr 24 14:00:00 CEST 2019"),
                          speaker: nil, room: nil, participants: [Participant](), canReview: true)
    workshopI?.room = conference.roomWithName("Aula 112")
    workshopI?.speaker = conference.speakerWithName("Carlos Cetina")
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Clary")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Jose Ignacio")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Libranner")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Milan")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Roger")))
    sessionI?.workshops?.append(workshopI!)
    trackI?.sessions?.append(sessionI!)
    sessionI = nil
    sessionI = Session(name: "Sesion 2", details: "Desarrollo de un DSL usando Eclipse MF", startDate: convertDateFrom("Thu Apr 25 09:00:00 CEST 2019"),
                       endDate: convertDateFrom("Thu Apr 25 14:00:00 CEST 2019"), picture: URL(string: "https://bit.ly/2WU9nmG"), talks: [Talk](), workshops: [Workshop]())
    talkI  = Talk(name: "Modelado", details: "Transformacion de M2M y M2T", startDate: convertDateFrom("Thu Apr 25 09:00:00 CEST 2019"),
                  endDate: convertDateFrom("Thu Apr 25 10:30:00 CEST 2019"), speaker: nil, room: nil,
                  participants: [Participant](), canReview: true, canAsk: true)
    talkI?.room = conference.roomWithName("Aula 113 B")
    talkI?.speaker = conference.speakerWithName("Jaime Font")
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Clary")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Eddy")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Esmir")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Gumer")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Javier")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Jose Ignacio")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Libranner")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Milan")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Roger")))
    sessionI?.talks?.append(talkI!)
    workshopI  = Workshop(name: "Has tu propio Phonegap", details: "Modelado de aplicaciones de dominio especifico",
                          startDate: convertDateFrom("Thu Apr 25 00:00:00 CEST 2019"), endDate: convertDateFrom("Thu Apr 25 00:00:00 CEST 2019"),
                          speaker: nil, room: nil, participants: [Participant](), canReview: false)
    workshopI?.room = conference.roomWithName("Aula 113 B")
    workshopI?.speaker = conference.speakerWithName("Jaime Font")
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Clary")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Eddy")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Esmir")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Gumer")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Javier")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Jose Ignacio")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Libranner")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Milan")))
    workshopI?.participants?.append(conference.addParticipant(Participant(name: "Roger")))
    sessionI?.workshops?.append(workshopI!)
    trackI?.sessions?.append(sessionI!)
    sessionI = nil
    sessionI = Session(name: "Sesion 3", details: "Wrapping up e introduccion a Xamarin", startDate: convertDateFrom("Fri Apr 26 09:00:00 CEST 2019"),
                       endDate: convertDateFrom("Fri Apr 26 14:00:00 CEST 2019"), picture: URL(string: "https://bit.ly/2X1FAZw"), talks: [Talk](), workshops: [Workshop]())
    talkI  = Talk(name: "Presentacion de Proyectos", details: "Presentacion de Proyectos de los Alumnos", startDate: convertDateFrom("Fri Apr 26 12:00:00 CEST 2019"),
                  endDate: convertDateFrom("Fri Apr 26 14:00:00 CEST 2019"), speaker: nil, room: nil,
                  participants: [Participant](), canReview: false, canAsk: false)
    talkI?.room = conference.roomWithName("Aula 6.1")
    talkI?.speaker = conference.speakerWithName("Carlos Cetina")
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Clary")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Eddy")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Esmir")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Gumer")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Javier")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Jose Ignacio")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Libranner")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Milan")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Roger")))
    sessionI?.talks?.append(talkI!)
    talkI  = Talk(name: "Xamarin", details: "Compilación en la plataforma Xamarin", startDate: convertDateFrom("Fri Apr 26 09:00:00 CEST 2019"),
                  endDate: convertDateFrom("Fri Apr 26 11:30:00 CEST 2019"), speaker: nil, room: nil,
                  participants: [Participant](), canReview: true, canAsk: true)
    talkI?.room = conference.roomWithName("Aula 6.1")
    talkI?.speaker = conference.speakerWithName("Charlin Agramonte")
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Clary")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Eddy")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Esmir")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Gumer")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Javier")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Jose Ignacio")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Libranner")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Milan")))
    talkI?.participants?.append(conference.addParticipant(Participant(name: "Roger")))
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
