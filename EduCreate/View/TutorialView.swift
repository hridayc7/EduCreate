//
//  TutorialView.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/19/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI
import MessageUI

struct TutorialView: View {
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var userDaata: UserData
    var tut: Tutorial
    
    
    var tutorialIndex: Int{
        userDaata.googleList.firstIndex(where: { $0.id == tut.id }) ?? 0
    }
    
    var body: some View {
        
        List{
            ZStack (alignment: .bottom) {
                Image(tut.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.25)
                    .blur(radius: 10)
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Session With \(tut.name)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
                
            }
            VStack(alignment: .center)
            {
                Text("Session Date: \(tut.when)")
                    .bold()
                    .lineSpacing(12.0)
                    .padding(.bottom)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Subject: \(tut.subject)")
                    .bold()
                    .lineSpacing(12.0)
                    .padding(.bottom)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            HStack{
                Spacer()
                Button(action: {
                    print("Cancel Button Tapped")
                    
                    sourcewascancel = true
                    tutorName = self.userDaata.googleList[self.tutorialIndex].name
                    tutorTime = self.userDaata.googleList[self.tutorialIndex].when
                    tutorSubject = self.userDaata.googleList[self.tutorialIndex].subject
                    
                    self.userDaata.googleList.remove(at: self.tutorialIndex)
                    tutorialList.remove(at: self.tutorialIndex)
                    blackList.remove(at: self.tutorialIndex)
                    UserDefaults.standard.set(blackList, forKey: "blackList")
                    
                    //Make them know this view is the sender
                    MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                    
                    self.mode.wrappedValue.dismiss()
                    //edit blackList
                    //edit tutorialList
                    
                    
                }){
                    Text("Cancel Session")
                        .multilineTextAlignment(.center)
                        .padding()
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .font(.headline)
                .background(Color.red)
                .cornerRadius(10)
                .sheet(isPresented: $isShowingMailView) {
                    MailView(result: self.$result)
                }
                .alert(isPresented: self.$alertNoMail) {
                    Alert(title: Text("NO MAIL SETUP"))
                }
                
                Spacer()
            }
            .navigationBarTitle(Text("Session with \(tut.name)"),displayMode: .inline)
            .padding()
            
        }
        
    }
}



