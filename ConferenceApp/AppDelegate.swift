//
//  AppDelegate.swift
//  ConferenceApp
//
//  Created by Libranner Leonel Santos Espinal on 22/03/2019.
//  Copyright © 2019 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    var dict = [String: [TableViewData]]()
    
    let url = URL(string: "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_1280.jpg")
    
    let venue = Venue(name: "Sample", direction: "asdasdsadasdas asdasd", latitude: 1, longitude: 2, photoURL: url)
    
    let data = [TableViewData(title: "asdasdasdasd", subtitle: "2323232323", imagePath: url, object: venue)]
    let data2 = [TableViewData(title: "niniknkin", subtitle: "2323232323", imagePath: url, object: venue)]
    dict["ddd"] = data
    dict["222"] = data2
    
    //let vc = CustomTableViewController(style: .plain, data: dict)
    let vc = PlaceViewController()
    
    let viewController = UINavigationController(rootViewController: vc)
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = viewController
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

