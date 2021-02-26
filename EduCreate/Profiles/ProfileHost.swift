//
//  ProfileHost.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/13/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//


import SwiftUI


struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                        //UserDefaults.standard.set("Hriday", forKey: "name")
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                        print("Edits Complete")
                        Share.setName(newName: self.userData.profile.username)
                        UserDefaults.standard.set(self.userData.profile.username, forKey: "username")
                        //Share.setName(newName: defaults.string(forKey: "username")!)
                        UserDefaults.standard.set(self.userData.profile.subjectPreference.rawValue, forKey: "sub")
                        UserDefaults.standard.set(self.userData.profile.school.rawValue, forKey: "school")
                        Share.populateRecomended(level: self.userData.profile.school.rawValue, subject: self.userData.profile.subjectPreference.rawValue)
                        
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
