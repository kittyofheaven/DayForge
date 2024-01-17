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
        db.collection("users/\(userID)/moodLog").getDocuments { snapshot, error in
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
                                    smoke: d["smoke"] as? Int ?? 0,
                                    alcohol: d["alcohol"] as? Int ?? 0,
                                    selfharm: d["selfharm"] as? Int ?? 0,
                                    added: d["added"] as? Double ?? 0)
                    }
                    // Sort the moods array based on added in ascending order
                    self.sortMoodsDescending()
                }
            }
        }
    }
    
    // Function to sort moods array based on added in ascending order
    func sortMoodsDescending() {
        moods.sort { $0.added > $1.added }
    }
    
    func returnString() -> String {
//        print(moods)
        return "hello"
    }
    
    func thirtyMood() -> [Mood] {
        // Ensure that moods array is sorted before retrieving the first 30 elements
//        print(moods)
        let sortedMoods = moods.prefix(30)
        return Array(sortedMoods.reversed())
    }
    
}
