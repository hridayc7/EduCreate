//
//  VolunteerDetail.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import SwiftUI
import MessageUI

struct VolunteerDetail : View {
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    var vol:Volunteer
    
    @State private var selectedDate = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
     @EnvironmentObject var userData: UserData
    
    var body: some View {
        
   
        
        List{
            ZStack (alignment: .bottom) {
                Image(vol.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    Rectangle()
                        .frame(height: 80)
                        .opacity(0.25)
                        .blur(radius: 10)
                        HStack{
                            VStack(alignment: .leading, spacing: 8){
                                Text(vol.name)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            .padding(.leading)
                            .padding(.bottom)
                            Spacer()
                        }
                
                    }
            .listRowInsets(EdgeInsets())
            VStack(alignment: .leading) {
                
                HStack
                {
                    //Spacer()
                    Text("Grade \(vol.grade)")
                    .foregroundColor(.primary)
                        .font(.headline)
                    .lineLimit(nil)
                    .lineSpacing(12)
                    .padding(.bottom, 10)
                    Spacer()

                        
                }
                
                Spacer()
                Text("Availability ")
                        .foregroundColor(.primary)
                        .font(.body)
                        .bold()
                        .lineLimit(1)
                        .lineSpacing(12)
                        .padding(.bottom, 5)
                Text(vol.time)
                        .foregroundColor(.primary)
                        .font(.body)
                        .lineLimit(nil)
                        .lineSpacing(12)
                        .padding(.bottom, 15)
                
                Text("Grades Teaching")
                        .foregroundColor(.primary)
                        .font(.body)
                        .bold()
                        .lineLimit(1)
                        .lineSpacing(12)
                        .padding(.bottom, 5)
                Text(vol.teaching)
                        .foregroundColor(.primary)
                        .font(.body)
                        .lineLimit(nil)
                        .lineSpacing(12)
                        .padding(.bottom, 15)
                
                
                Text("About Me ")
                    .foregroundColor(.primary)
                    .font(.body)
                    .bold()
                    .lineLimit(1)
                    .lineSpacing(12)
                    .padding(.bottom, 5)
                Text(vol.description)
                    .foregroundColor(.primary)
                    .font(.body)
                    .lineSpacing(12)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)   

                    .padding(.bottom, 20)
                //Spacer()
                Text("Why I Am Tutoring ")
                    .foregroundColor(.primary)
                    .font(.body)
                    .bold()
                    //.lineLimit(1)
                    .lineSpacing(12)
                    .padding(.bottom, 5)
                Text(vol.reason)
                    .foregroundColor(.primary)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(12)
                    .padding(.bottom, 15)
                    .fixedSize(horizontal: false, vertical: true)

            }
            .padding(.top)
            .padding(.bottom)
            
            Text("Sign Up Date")
                .bold()
            DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date){
                Text("")
            }.padding(30)
            Text("Selected Date is \(selectedDate, formatter: dateFormatter)")

            
            HStack {
                Spacer()
                        Button(action: {
                            Share.setcurrentVol(name: self.vol.name)
                            Share.setcurrentSubject(name: self.vol.category.rawValue)
                            Share.setSource(tello: true)
                            //add string to list
                            Share.makeString(name: self.vol.name, timeSlot: self.selectedDate, subject: self.vol.category.rawValue, positon: "\(blackList.count)")//blacklist is updated
                            let obj = Share.parseAndMake(text: blackList[blackList.count-1])
                            self.userData.googleList.append(obj)
                            print(self.userData.googleList)
                            print("x")
                            print(self.userData.googleList)
                            MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                        }) {
                            Text("Sign Up For Session")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(width: 200, height: 50)
                            .foregroundColor(.white)
                            .font(.headline)
                            .background(Color.blue)
                            .cornerRadius(10)
                        .sheet(isPresented: $isShowingMailView) {
                                MailView(result: self.$result)
                        }
                        .alert(isPresented: self.$alertNoMail) {
                            Alert(title: Text("NO MAIL SETUP"))
                        }
                Spacer()
            }.padding()
            
        }.padding(.vertical)
            
            
        .edgesIgnoringSafeArea(.top)
    }
}



struct ContactButton : View {
    var body: some View {
        
        Button(action: {
            print("Button Tapped")
            
        }) {
            Text("Setup Session wit")
            }.frame(width: 200, height: 50)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.blue
                .animation(.spring()))
        .cornerRadius(10)
        
    }
}


#if DEBUG
struct Volunteer_Detail_Previews : PreviewProvider {
    static var previews: some View {
        VolunteerDetail(vol: volunteerData[3])
    }
}
#endif
