//
//  QuizViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 08/01/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class QuizViewModel: ObservableObject {
    @AppStorage("uid") var userID: String = ""
    @Published var errorMsg: String = ""
    
    @Published var moodButtonClicked: [Bool] = [false, false, false, false, false]
    @Published var moodValue: Int = 0 // default value
    
    @Published var cigarButtonClicked: [Bool] = [false, false, false, false, false, false]
    @Published var cigarValue: Int? = nil // default value
    
    @Published var alcoholButtonClicked: [Bool] = [false, false, false, false, false, false]
    @Published var alcoholValue: Int? = nil // default value
    
    @Published var selfharmButtonClicked: [Bool] = [false, false, false, false, false, false]
    @Published var selfharmValue: Int? = nil // default value
    
    init(){}
    
    // MOOD FUNCTION
    func moodPressReset() {
        errorMsg = ""
        moodButtonClicked = [false, false, false, false, false]
        moodValue = 0
    }
    
    func moodPressed(_ howMany: Int){
        moodPressReset()
        moodValue = howMany + 1
        for i in 0...howMany {
            moodButtonClicked[i] = true
        }
    }
    // MOOD FUNCTION END
    
    // CIGAR FUNCTION
    func cigarPressReset() {
        errorMsg = ""
        cigarButtonClicked = [false, false, false, false, false, false]
        cigarValue = nil
    }
    
    func cigarPressed(_ howMany: Int){
        cigarPressReset()
        cigarValue = howMany
        for i in 0...howMany {
            cigarButtonClicked[i] = true
        }
    }
    // CIGAR FUNCTION END
    
    // ALCOHOL FUNCTION
    func alcoholPressReset() {
        errorMsg = ""
        alcoholButtonClicked = [false, false, false, false, false, false]
        alcoholValue = nil
    }
    
    func alcoholPressed(_ howMany: Int){
        alcoholPressReset()
        alcoholValue = howMany
        for i in 0...howMany {
            alcoholButtonClicked[i] = true
        }
    }
    // ALCOHOL FUNCTION END
    
    // SH FUNCTION
    func selfharmPressReset() {
        errorMsg = ""
        selfharmButtonClicked = [false, false, false, false, false, false]
        selfharmValue = nil
    }
    
    func selfharmPressed(_ howMany: Int){
        selfharmPressReset()
        selfharmValue = howMany
        for i in 0...howMany {
            selfharmButtonClicked[i] = true
        }
    }
    // SH FUNCTION END
    
    func logMood(){
        
        guard moodValue != 0 && cigarValue != nil && alcoholValue != nil && selfharmValue != nil else {
            errorMsg = "Please fill in all question!"
            return
        }
        
        let newId = UUID().uuidString
        let newMood: Mood = Mood(
            id: newId,
            mood: moodValue,
            smoke: cigarValue ?? 0,
            alcohol: alcoholValue ?? 0,
            selfharm: selfharmValue ?? 0,
            added: Date().timeIntervalSince1970
        )
        
        errorMsg = ""
        moodPressReset()
        cigarPressReset()
        alcoholPressReset()
        selfharmPressReset()
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("moodLog")
            .document(newId)
            .setData(newMood.asDictionary())
    }

}
