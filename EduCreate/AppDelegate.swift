//
//  AppDelegate.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITableView.appearance().tableFooterView = UIView()
        let defaults = UserDefaults.standard
        blackList = Share.getBlackList()
        for list in blackList {
            _ = Share.parseAndMake(text: list)
        }
        defaults.set("John Doe", forKey: "username")
        print(tutorialList)
        if(!(defaults.string(forKey: "username") == nil))
        {
            if(!(defaults.string(forKey: "sub") == nil))
            {
                if(!(defaults.string(forKey: "school") == nil)){
                    let curSub = defaults.string(forKey: "sub")
                    let curSchool = defaults.string(forKey: "school")
                    Share.populateRecomended(level: curSchool!, subject: curSub!)
                    print("This is App Delegate Town Baby")
                    print(recomended)
                }
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

