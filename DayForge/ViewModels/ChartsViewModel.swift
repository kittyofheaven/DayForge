//
//  ChartsViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 11/01/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Foundation

class ChartsViewModel: ObservableObject {
    @AppStorage("uid") var userID: String = ""
    
    @Published var moods = [Mood]()
    
    func fetchData(){
        let db = Firestore.firestore()
        db.collection("users/t1mRTcYPVWbf7do28TQLGN8gFEG2/moodLog").getDocuments { snapshot, error in
            //handle error
//            guard error==nil else {
//                print(error as Any)
//                return
//            }
            
            if let snapshot = snapshot {
                
                DispatchQueue.main.async {//get all docs
                    self.moods = snapshot.documents.map { d in
                        return Mood(id: d.documentID,
                                    mood: d["mood"] as? Int ?? 0,
                                    smoke: d["cigar"] as? Int ?? 0,
                                    alcohol: d["alcohol"] as? Int ?? 0,
                                    selfharm: d["selfharm"] as? Int ?? 0,
                                    added: d["added"] as? Double ?? 0)
                    }
                    // Sort the moods array based on added in ascending order
                    self.sortMoodsAscending()
                }
            }
        }
    }
    
    // Function to sort moods array based on added in ascending order
    func sortMoodsAscending() {
        moods.sort { $0.added < $1.added }
    }
    
    func returnString() -> String {
        print(moods)
        return "hello"
    }
    
    
}