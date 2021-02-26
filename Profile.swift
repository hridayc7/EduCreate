/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An object that models a user profile.
*/
import Foundation

struct Profile {
    var username: String
    var school: emoji
    var subjectPreference: work
    
    static let `default` = Self(username: Share.getName(), school: .elementary, subjectPreference: .english)
    
    init(username: String, school: emoji, subjectPreference: work) {
        self.username = username
        self.school = school
        self.subjectPreference = .english
        
    }
    enum emoji: String, CaseIterable {
        case elementary = "Elementary"
        case middleSchool = "Middle School"
    }
    
    enum work: String, CaseIterable {
        case english = "English"
        case math = "Math"
        case science = "Science"
        case socialStudies = "Social Studies"
        case spanish = "Spanish"
    }
    
    
    
}
