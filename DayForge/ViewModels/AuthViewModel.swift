//
//  AuthViewModel.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var currentView: String =  "first"
    
    func changeCurrentViewtoRegister(){
        currentView = "register"
    }
    
    func changeCurrentViewtoLogin(){
        currentView = "login"
    }
    
    func changeCurrentViewtoSecondWelcomePage(){
        currentView = "second"
    }
}
