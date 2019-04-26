//
//  ActivityViewController.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 14/04/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit
import MapKit

protocol ActivityViewControllerDelegate {
  func showSpeaker(activityView: ActivityView, speaker: Speaker)
  func showQuestionForm(activityView: ActivityView, activity: Activity)
  func showNavigation(activityView: ActivityView, latitude: Float, longitude: Float)
  func showReviewForm(activityView: ActivityView, activity: Activity)
}

class ActivityViewController: UIViewController {
  var activityView: ActivityView!
  
  var activity: Activity? {
    didSet {
      if activity != nil {
        load()
      }
    }
  }
  
  func fadeIn(view: UIView) {
    view.alpha = 1
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.activityView.alpha = 0
    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
      self.fadeIn(view: self.activityView)
    }, completion: nil)
  }
  
  fileprivate func load() {
    
    if activity is Talk {
      activityView = loadTalk(activity as! Talk)
    }
    else {
      activityView = loadWorkshop(activity as! Workshop)
    }
    
    activityView.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.addSubview(activityView)
    
    activityView.navigationButton.addTarget(self, action: #selector(navigationButtonTapped), for: .touchUpInside)
    activityView.askButton.addTarget(self, action: #selector(questionButtonTapped), for: .touchUpInside)
    activityView.speakerButton.addTarget(self, action: #selector(speakerButtonTapped), for: .touchUpInside)
    activityView.reviewButton.addTarget(self, action: #selector(reviewButtonTapped), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      activityView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      activityView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      activityView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      activityView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
  }
  
  @objc fileprivate func navigationButtonTapped() {
    if let room = activity?.room {
      let regionDistance:CLLocationDistance = 10000
      let coordinates = CLLocationCoordinate2DMake(CLLocationDegrees(room.latitude), CLLocationDegrees(room.longitude))
      let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
      let options = [
        MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
        MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
      ]
      
      let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
      
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = activity?.name
      mapItem.openInMaps(launchOptions: options)
    }
  }
  
  @objc fileprivate func speakerButtonTapped() {
    if let speaker = activity?.speaker {
      let speakerView = SpeakerView()
      speakerView.speakerBio = speaker.bio
      speakerView.speakerName = speaker.name
      speakerView.speakerImageUrl = speaker.picture
      
      presentView(speakerView)
    }
  }
  
  @objc fileprivate func questionButtonTapped() {
    let questionView = QuestionView()
    presentView(questionView)
  }
  
  @objc fileprivate func reviewButtonTapped() {
    let reviewView = ReviewView()
    presentView(reviewView)
  }
  
  fileprivate func presentView(_ customView: UIView) {
    customView.translatesAutoresizingMaskIntoConstraints = false
    
    let vc = ContentViewController()
    vc.containerView.addSubview(customView)
    
    NSLayoutConstraint.activate([
      customView.topAnchor.constraint(equalTo: vc.containerView.safeAreaLayoutGuide.topAnchor),
      customView.leadingAnchor.constraint(equalTo: vc.containerView.safeAreaLayoutGuide.leadingAnchor),
      customView.trailingAnchor.constraint(equalTo: vc.containerView.safeAreaLayoutGuide.trailingAnchor),
      customView.bottomAnchor.constraint(equalTo: vc.containerView.safeAreaLayoutGuide.bottomAnchor)
      ])
    
    self.present(vc, animated: true)
  }
  
  fileprivate func loadTalk(_ talk: Talk) -> ActivityView {
    let activityView = ActivityView()
    activityView.canAsk = talk.canAsk
    activityView.canReview = talk.canReview
    activityView.detail = talk.details
    activityView.formattedDate = talk.formattedDate
    activityView.name = talk.name
    activityView.photoImage = UIImage(named: "talk_background")
    activityView.room = talk.room?.name
    
    return activityView
  }
  
  fileprivate func loadWorkshop(_ workshop: Workshop) -> ActivityView {
    let activityView = ActivityView()
    activityView.canReview = workshop.canReview
    activityView.detail = workshop.details
    activityView.formattedDate = workshop.formattedDate
    activityView.name = workshop.name
    activityView.photoImage = UIImage(named: "workshop_background")
    activityView.room = workshop.room?.name
    
    return activityView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
