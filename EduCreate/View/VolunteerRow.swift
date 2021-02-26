//
//  VolunteerRow.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI

struct VolunteerRow : View {
    
    var categoryName:String
    var volunteers:[Volunteer]
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(self.categoryName.uppercased())
                .font(.system(size: 26.0, weight: .semibold, design: .default))
                .lineLimit(nil)
            
            
                
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top) {
                    
                    ForEach(self.volunteers, id: \.name, content: { volunteer in
                        NavigationLink(destination: VolunteerDetail(vol: volunteer)) {
                        
                            VolunteerItem(vol: volunteer)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                        }
                        
                    })
                
                }
            })
        }
        
        
        
    }
}

#if DEBUG
struct Volunteer_Row_Previews : PreviewProvider {
    static var previews: some View {
        VolunteerRow(categoryName: "Hot Drinks", volunteers: volunteerData)
    }
}
#endif

