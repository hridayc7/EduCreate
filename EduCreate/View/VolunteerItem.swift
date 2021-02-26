//
//  VolunteerItem.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI

struct VolunteerItem : View {
    
    var vol:Volunteer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(vol.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 5.0) {
                Text(vol.name)
                .foregroundColor(.primary)
                .font(.headline)
                Text("Available \(vol.time)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                    .frame(height: 40)
            }
            
        }
    }
}

#if DEBUG
struct DrinkItem_Previews : PreviewProvider {
    static var previews: some View {
        VolunteerItem(vol: volunteerData[0])
    }
}
#endif
