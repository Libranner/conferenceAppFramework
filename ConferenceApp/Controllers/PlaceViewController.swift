//
//  PlaceViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {
  
  var item: Venue!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    loadData()
    //load()
  }
  
  fileprivate func loadData() {
    /*let placeView = ContentView(frame: .zero)
    placeView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(placeView)
    placeView.contentName = item.name
    placeView.contentDetail = item.direction
    placeView.photoImageUrl = item.photoURL*/
    
    
    let placeView = SpeakerView(frame: .zero)
    placeView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(placeView)
    placeView.speakerName = item.name
    placeView.speakerBio = item.direction
    let url = URL(string: "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_1280.jpg")
    placeView.speakerImageUrl = url
    
    
    /*placeView.contentName = "sdasdasdsad"
    placeView.contentDetail = "sdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsadsdafdsv skdbdfkja djasdnasjdhoas asjdkjasdnasjkdhsad"
    placeView.formattedDate = "12-01-2019 hasta 13-03-2019"*/
    
    NSLayoutConstraint.activate([
      placeView.topAnchor.constraint(equalTo: view.topAnchor),
      placeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      placeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      placeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
  }
  
 
  
  
}
