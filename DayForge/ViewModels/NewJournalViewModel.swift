//
//  JournalViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 09/01/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class NewJournalViewModel: ObservableObject {
    
    @AppStorage("uid") var userID: String = ""
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var maxContentLength: Int = 500
    @Published var dateNow: String = Date().formatted(date: .abbreviated, time: .omitted)
    @Published var timeNow: String = Date().formatted(date: .omitted, time: .shortened)
    
    init() {}
    
    func maxLength() -> Bool {
        if content.count < maxContentLength {
            return true
        } else {
            return false
        }
    }
    
    func logJournal(){
        let newId = UUID().uuidString
        
        let newJournal = Journal(id: newId,
                                 uid: userID,
                                 title: title,
                                 content: content,
                                 mentalIssuesFlag: "waiting",
                                 updated: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("journals")
            .document(newId)
            .setData(newJournal.asDictionary())
    }
}
