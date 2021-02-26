//
//  Volunteer.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI
import Foundation

struct Volunteer: Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    var imageName:String
    var category:Category
    var description:String
    var grade: String
    var reason: String
    var school: String
    var time: String
    var teaching: String
    var timimng: [Int]
    
    //var isRecomended = false
    
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case math = "math"
        case science = "science"
        case english = "english"
        case socialstudies = "social studies"
        case spanish = "spanish"
    }
    
}
