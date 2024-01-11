//
//  JournalViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 10/01/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class JournalViewModel: ObservableObject {
    @AppStorage("uid") var userID: String = ""
    @Published var showingNewJournalView: Bool = false
    @Published var showingEditJournalView: Bool = false
    
    @Published var maxContentLength = 500
    @Published var editedJournalId: String = ""
    @Published var editedTitle: String = ""
    @Published var editedContent: String = ""
    @Published var editTimeSince1970: Double = 0
    init(){}
    
    func unixToDate()-> String{
        let date = Date(timeIntervalSince1970: TimeInterval(editTimeSince1970)).formatted(date: .abbreviated, time: .omitted)
        return date
    }
    
    func unixToTime()-> String{
        let date = Date(timeIntervalSince1970: TimeInterval(editTimeSince1970)).formatted(date: .omitted, time: .shortened)
        return date
    }
    
    func maxLength() -> Bool {
        if editedContent.count < maxContentLength {
            return true
        } else {
            return false
        }
    }
    
    func updateJournal(){
        let updatedJournal = Journal(id: editedJournalId,
                                 uid: userID,
                                 title: editedTitle,
                                 content: editedContent,
                                 mentalIssuesFlag: false,
                                 updated: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("journals")
            .document(editedJournalId)
            .setData(updatedJournal.asDictionary())
    }
    
    func deleteJournal(docId: String){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("journal")
            .document(docId)
            .delete()
    }
}
