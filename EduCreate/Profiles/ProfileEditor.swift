//
//  ProfileEditor.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/13/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
        
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("School")
                    .bold()
                
                Picker("School", selection: $profile.school) {
                    ForEach(Profile.emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue).tag(emoji)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Subject")
                    .bold()
                Picker("", selection: $profile.subjectPreference) {
                    ForEach(Profile.work.allCases, id: \.self) { work in
                        Text(work.rawValue).tag(work)
                    }
                }
            }
            
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
