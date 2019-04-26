//
//  AppDelegate.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDvargate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    let conferenceViewController = ConferenceViewController()
    conferenceViewController.tabBarItem.image = UIImage(named: "conference")
    conferenceViewController.title = "Conference"
    
    var data = [TableViewData]()
    
    let conference = Loader.shared.conferenceData()
    conference.tracks?.forEach({ (track) in
      data.append(TableViewData(title: track.name, subtitle:"", imagePath: nil, object: track as AnyObject))
    })
    
    let vc = TracksViewController(style: .plain, data: ["": data], onSelected: nil)
    let tracksViewController = UINavigationController(rootViewController: vc)
    tracksViewController.tabBarItem.image = UIImage(named: "tracks")
    tracksViewController.title = "Tracks"
    
    var viewcontrollers = [conferenceViewController, tracksViewController]
    
    if let feeds = conference.socialFeeds {
      let socialFeedViewController = UINavigationController(rootViewController: SocialFeedTableViewController(style: .plain, data: feeds))
      socialFeedViewController.tabBarItem.image = UIImage(named: "social_feed")
      socialFeedViewController.title = "Social Feed"
      
      viewcontrollers.append(socialFeedViewController)
    }

    let tabVC = UITabBarController()
    tabVC.viewControllers = viewcontrollers
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = tabVC
    window?.makeKeyAndVisible()
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

