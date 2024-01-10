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
    
    init(){}
    
    
    
    func deleteJournal(docId: String){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("journal")
            .document(docId)
            .delete()
    }
}
