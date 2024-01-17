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
    
    @Published var journals = [Journal]()
    @Published var mentalIssuesFlag: String = "waiting"
    
    init(){}
    
    func fetchData(){
        let db = Firestore.firestore()
        db.collection("users/\(userID)/journals").getDocuments { snapshot, error in

            
            if let snapshot = snapshot {
                
                DispatchQueue.main.async {//get all docs
                    self.journals = snapshot.documents.map { d in
                        return Journal(
                                    id: d["id"] as? String ?? "",
                                    uid: d["uid"] as? String ?? "",
                                    title: d["title"] as? String ?? "",
                                    content: d["content"] as? String ?? "",
                                    mentalIssuesFlag: d["mentalIssuesFlag"] as? String ?? "",
                                    updated: d["updated"] as? TimeInterval ?? 0)
                    }
                    // Sort the moods array based on added in ascending order
                    self.sortJournalsDescending()
                    
                    for journal in self.journals {
                        if journal.mentalIssuesFlag == "waiting" {
                            self.postAndAnalyzeSentiment(title: journal.title, content: journal.content)
                        }
                    }
                }
            }
        }
    }
    
    // Function to sort journals in descending order based on the updated time interval
    func sortJournalsDescending() {
        self.journals.sort { $0.updated > $1.updated }
    }

    func postAndAnalyzeSentiment(title: String, content: String) {
        let apiURL = "https://dayforgemlapi.azurewebsites.net/predict_sentiment"
        
        // Create the JSON data
        let postData: [String: String] = ["texts": title + " " + content]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: postData)
            
            // Create the URLRequest
            var request = URLRequest(url: URL(string: apiURL)!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            // Make the API request
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        // Parse the JSON response
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        
                        // Extract sentiment and update mentalIssuesFlag
                        if let sentiment = jsonResponse["sentiment"] as? String {
                            self.updateMentalIssuesFlag(sentiment: sentiment)
                        }
                    } catch {
                        print("Error parsing JSON response: \(error.localizedDescription)")
                    }
                }
            }.resume()
        } catch {
            print("Error creating JSON data: \(error.localizedDescription)")
        }
    }

    func updateMentalIssuesFlag(sentiment: String) {
        switch sentiment {
        case "positive":
            self.mentalIssuesFlag = "positive"
        case "negative":
            self.mentalIssuesFlag = "negative"
        default:
            self.mentalIssuesFlag = "neutral"
        }
        
        updateJournal()
        mentalIssuesFlag = "waiting"
    }

    
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
                                 mentalIssuesFlag: mentalIssuesFlag,
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
