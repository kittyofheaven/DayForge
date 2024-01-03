//
//  LoginViewModel.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import Foundation
import FirebaseAuth
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var userEmail:String = ""
    @Published var userPassword:String = ""
    @Published var errorMsg: String = ""
    @AppStorage("uid") var userID: String = ""
    
    init() {}
    
    private func validate() -> Bool {
        
        errorMsg = ""
        
        guard !userEmail.trimmingCharacters(in: .whitespaces).isEmpty,
              !userPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please fill in all fields"
            return false
        }
        
        return true
    }
    
    func signIn() {
        
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword){ [weak self] authResult, error in
            
            guard let userId = authResult?.user.uid else {
                
                var errorMessage = error?.localizedDescription ?? "an error occured"
                
                if errorMessage == "The supplied auth credential is malformed or has expired." {
                    errorMessage = "Username or password is wrong!"
                }
                
                self?.errorMsg = errorMessage
                return
            }
            
//            print(userId)
            withAnimation {
                self?.userID = userId
            }
            

            
        }
        
    }

}
