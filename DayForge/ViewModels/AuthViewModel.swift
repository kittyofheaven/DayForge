//
//  AuthViewModel.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var currentView: String =  "login"
    
    func changeCurrentViewtoRegister(){
        currentView = "register"
    }
    
    func changeCurrentViewtoLogin(){
        currentView = "login"
    }
    
}
