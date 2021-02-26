//
//  TutorialList.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/19/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI





struct TutorialList: View {
    
    @State var theList = tutorialList
    @EnvironmentObject var userData: UserData
    
    
    
   // var hello:[Tutorial] =
    var body: some View {
        List {
            ForEach(userData.googleList, id: \.self) { user in
                TutorialRow(tutorial: user)
            }
        }.navigationBarTitle("Sessions", displayMode: .inline)
    }
    func delete(at offsets: IndexSet) {
        tutorialList.remove(atOffsets: offsets)
        print("deleted.......")
        print(tutorialList)
    }
    
}

struct TutorialList_Previews: PreviewProvider {
    static var previews: some View {
        TutorialList()
    }
}
