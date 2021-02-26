//
//  AppView.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/14/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            TutorialView(tut: tutorialList[0])
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let home = HomeView()
    static var previews: some View {
        HomeView()
        .environmentObject(UserData())
    }
}
