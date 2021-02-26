//
//  share.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import Foundation

var currentVol = "Person X"
var currentSubject = "English"
var sourceWasVolunteer = false

var user = "John Doe"

var blackList: [String] = []

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}

let formatter = DateFormatter()

var tutorialList: [Tutorial] = []

var sourcewascancel = false

 
extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}

var tutorName = "John"
var tutorTime = "..."
var tutorSubject = "Fine Line"


class Share{
    
   
    
    static func populateRecomended(level: String, subject: String)
    {
        recomended.removeAll()
        for volunteer in volunteerData
        {
            if ((!(volunteer.teaching.contains("5"))) && (level == "Middle School")) {
                if volunteer.category.rawValue.lowercased() == subject.lowercased(){
                    recomended.append(volunteer)
                }
                
            }
            if(level == "Elementary")
            {
                if volunteer.category.rawValue.lowercased() == subject.lowercased() {
                    recomended.append(volunteer)
                }
                
            }
        }
        print("Finished this Function")
    }
    
    static func makeString(name: String, timeSlot: Date, subject: String, positon: String)
    {
        formatter.dateStyle = .short
        print(timeSlot)
        //Get The Date in the Right format here
        let str = formatter.string(from: timeSlot)
        let lol = "\(name),\(str),\(subject.capitalizingFirstLetter()),\(positon)"
      
        
        blackList.append(lol)
        UserDefaults.standard.set(blackList, forKey: "blackList")

    }
    
    static func parseAndMake(text: String) -> Tutorial
    {
        let parts = text.components(separatedBy: ",")
        print(parts)
        let tut = Tutorial(n: parts[0], w: parts[1], s: parts[2], i: parts[3])
        tutorialList.append(tut)
        // rint("🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕")
        return tut
    }
    
    
    
    static func getBlackList() -> [String]
    {
        let list = UserDefaults.standard.array(forKey: "blackList")
        if(!(list == nil))
        {
            return list as! [String]
        }
        return []
    }
    
    static func alterIDs(x: Int)
    {
        for i in 0...tutorialList.count-1
        {
            let currIndex = Int(tutorialList[i].index)
            if(currIndex!>x)
            {
                let replaceMentIndex = "\((currIndex!-1))"
                print("Replacement Index:  \(replaceMentIndex)")
                tutorialList[i].index = replaceMentIndex
                print(tutorialList[i].index)
                print("SHAY'S REBELLION")
            }
            
        }
    }
    
    static func iscancelButton()
    {
        sourcewascancel = true
    }
    
    
    static func setSource(tello: Bool)
    {
        sourceWasVolunteer = tello
    }
    
    
    
    static func setName(newName: String)
    {
        print("Something fishy")
        user = newName
        UserDefaults.standard.set(user, forKey: "username")
        
    }
    
    static func getName() -> String
    {
        if(UserDefaults.standard.string(forKey: "username") == nil)
        {
            return "John Doe"
        }
        return UserDefaults.standard.string(forKey: "username")!
    }
    
    static func getSchool() -> String
    {
        let def = UserDefaults.standard.string(forKey: "school")
        if(def == nil)
        {
            return "elementary school"
        }
        return def!
    }
    
    static func getSubject() -> String
    {
        let def = UserDefaults.standard.string(forKey: "sub")
        if(def == nil)
        {
            return "english"
        }
        return def!
    }
    
    static func getSource() -> Bool
    {
        let idiot = sourceWasVolunteer
        sourceWasVolunteer = !sourceWasVolunteer
        return idiot
    }
    
    static func setcurrentVol(name: String)
    {
        currentVol = name;
    }

    static func getcurrentVol() -> String
    {
        return currentVol;
    }
    
    static func setcurrentSubject(name: String)
    {
        currentSubject = name;
    }

    static func getcurrentSubject() -> String
    {
        return currentSubject;
    }
    
    static func findMatches(tutorPreference: Int, subject: String)
    {
        recomended.removeAll()
        var gradeLevel = 11
        if(tutorPreference == 2)
        {
            gradeLevel = 11
        }
     for volunteer in volunteerData{
        if(volunteer.grade == "\(gradeLevel)" && volunteer.category.rawValue == subject)
        {
            recomended.append(volunteer)
            print(volunteer.name)
        }
        }
    }
    
    static func getTutorialList() -> [Tutorial]
    {
        return tutorialList
    }
    
    
    
    
}


