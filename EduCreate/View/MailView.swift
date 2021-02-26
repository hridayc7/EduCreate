//
//  MailView.swift
//  EduCreate
//
//  Created by Hriday Chhabria on 4/12/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//


import SwiftUI
import UIKit
import MessageUI
import Foundation

struct MailView: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        
        vc.setToRecipients(["educreatetutors@gmail.com"])
        
        if(Share.getSource())
        {
            vc.setMessageBody("Hi, my name is \(Share.getName()) and I am looking to tutor with \(Share.getcurrentVol().uppercased()) for \(Share.getcurrentSubject().uppercased()) \(Share.getSchool())", isHTML: true)
            vc.setSubject("Request for \(Share.getcurrentSubject().uppercased()) tutoring with \(Share.getcurrentVol())")
        }
        else if(sourcewascancel)
        {
            
            vc.setMessageBody("Hi, my name is \(Share.getName()) and I am looking to cancel my \(tutorSubject) session with \(tutorName) that is scheduled for \(tutorTime)", isHTML: true)
            vc.setSubject("Request for Session Cancellation")
        }
        else
        {
            vc.setSubject("Help")
            vc.setMessageBody("Hello EduCreate", isHTML: true)
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
