//
//  HomeView.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI
import MessageUI

struct HomeView : View {
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    let defaults = UserDefaults.standard
    
    var categories:[String:[Volunteer]] {
        .init(
            grouping: volunteerData,
            by: {$0.category.rawValue}
        )
    }
    
    init() {
        if(!(defaults.string(forKey: "userName") == nil))
        {
            if(!(defaults.string(forKey: "sub") == nil))
            {
                if(!(defaults.string(forKey: "school") == nil)){
                    let curSub = defaults.string(forKey: "sub")
                    let curSchool = defaults.string(forKey: "school")
                    Share.populateRecomended(level: curSub!, subject: curSchool!)
                    
                }
            }
        }
    }
    
    
    @State var showingProfile = false
    
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var editButton: some View {
        Button(action: {
            Share.setSource(tello: false)
            MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
        })
        {
            Text("Contact Us")
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: TutorialList()) {
                    Text("Manage My Tutoring Sessions")
                    .bold()
                    //.navigationBarTitle("Sessions Signed Up For")
                }
                if(!(recomended.isEmpty))
                {
                    VolunteerRow(categoryName: "Recomended Tutors", volunteers: recomended)
                }
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    VolunteerRow(categoryName: key, volunteers: self.categories[key]!)
                }
                
            }
            .onAppear(){
                print("List Appeared")
            }
            .onDisappear(){
                    print("Dis")
            }
            .navigationBarTitle(Text("EduCreate💡"))
            .navigationBarItems(leading: editButton, trailing: profileButton)
                //.navigationBarItems(leading: editButton)
                .sheet(isPresented: $isShowingMailView) {
                    MailView(result: self.$result)
            }
            .alert(isPresented: self.$alertNoMail) {
                Alert(title: Text("The Mail App on your Device needs to be set up"))
            }
                //.navigationBarItems(trailing: profileButton)
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(self.userData)
            }
            
            
        }
        .onAppear(){
        }
        
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserData())
    }
}
#endif
