//
//  TutorialRow.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/19/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI

struct TutorialRow: View {
    
    var tutorial: Tutorial
    
    var body: some View {
        NavigationLink(destination: TutorialView(tut: tutorial)){
            HStack {
                Text("\(tutorial.subject.capitalizingFirstLetter()) session with \(tutorial.name)")
                Spacer()
            }
            
        }
    }
}

struct TutorialRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialRow(tutorial: tutorialList[0])
    }
}
