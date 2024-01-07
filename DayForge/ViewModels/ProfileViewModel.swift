//
//  ProfileViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 07/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class ProfileViewModel: ObservableObject {
    @AppStorage("uid") var userID: String = ""
    
    init() {
        fetchUser()
    }
    @Published var userNow: User? = nil
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            withAnimation {
                userID = ""
            }
            
        } catch let signOutError as NSError {
            
            print("Error signing out: %@", signOutError)
            
        }
    }
    
    func fetchUser() {
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument {[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.userNow = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ??  0
                )
            }
            
        }
        
    }
    
    
    
    
}
