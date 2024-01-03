//
//  AuthView.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        
        if viewModel.currentView == "login" {
            LoginView(authViewModel: viewModel)
        } else {
            RegisterView(authViewModel: viewModel)
        }
    }
}

#Preview {
    AuthView()
}
