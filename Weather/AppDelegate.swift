//
//  AppDelegate.swift
//  Weather
//
//  Created by Iskander Nizamov on 06.09.2021.
//

import GoogleMaps

class AppDelegate: NSObject, UIApplicationDelegate    {
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey(Config.shared.googleApiKey)
         return true
     }
 }
