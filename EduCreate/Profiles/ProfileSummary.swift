//
//  ProfileSummary.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/13/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//


import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    
    var body: some View {
        List {
            Text(Share.getName())
                .bold()
                .font(.title)
            
            Text("School Level: \(Share.getSchool())")
                .bold()
                .font(.body)
            
            Text("Subject Preference: \(Share.getSubject().capitalizingFirstLetter())")
            .bold()
            .font(.body)
            
            
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}

