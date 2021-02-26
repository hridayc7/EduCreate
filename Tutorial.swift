//
//  SessionView.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/19/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation


struct Tutorial: Hashable {
    var name: String
    var when: String
    var subject: String
    var index: String
    var imageName: String
    var id: Int
    
    let defaults = UserDefaults.standard
    
    
    
    init(n: String, w: String, s: String, i: String) {
        self.name = n
        self.when = w
        self.subject = s
        self.index = i
        
        var unagi = ""

        
        let x = defaults.integer(forKey: "pikachu")
        defaults.set(x+1, forKey: "pikachu")
        self.id = defaults.integer(forKey: "pikachu")
        
        for happy in volunteerData {
            if n.lowercased() == happy.name.lowercased() {
                unagi = happy.imageName
                break
            }
            else{
               unagi = "icon"
            }
        }
       self.imageName = unagi
    }
    
}

extension Tutorial {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

    

