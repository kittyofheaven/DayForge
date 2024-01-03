//
//  RegisterViewModel.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var userFullName:String = ""
    @Published var userEmail:String = ""
    @Published var userPassword:String = ""
    @Published var userConfirmPassword:String = ""
    @Published var errorMsg: String = ""
    @AppStorage("uid") var userID: String = ""
    
    init(){}
    
    private func validate() -> Bool {
        
        errorMsg = ""
        
        guard !userFullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !userEmail.trimmingCharacters(in: .whitespaces).isEmpty,
              !userPassword.trimmingCharacters(in: .whitespaces).isEmpty,
              !userConfirmPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please fill in all fields"
            return false
        }
        
        // email should have @ and .com
        guard userEmail.contains("@") && userEmail.contains(".") else {
            errorMsg = "Please enter valid email."
            return false
        }
        
        guard userPassword.count >= 8 else {
            errorMsg = "Password should contain minimum 8 letters"
            return false
        }
        
        guard userConfirmPassword == userPassword else {
            errorMsg = "Password doesn't match"
            return false
        }
        return true
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: userFullName,
                           email: userEmail,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func registerNewUserwithEmail(){
        
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { [weak self] authResult, error in
            
            guard let userId = authResult?.user.uid else {
                self?.errorMsg = error?.localizedDescription ?? "an error occured"
                return
            }
            
            self?.insertUserRecord(id: userId)
            withAnimation {
                self?.userID = userId
            }
        }
        
    }
}
