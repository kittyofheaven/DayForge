//
//  RegisterView.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
       
        ZStack{
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                Spacer()
                
                HeadingView()
                
                Spacer()
                
                HStack{
                    Text(viewModel.errorMsg)
                        .foregroundStyle(Color.red)
                    Spacer()
                }
                
                //Full Name
                HStack{
                    Image(systemName: "person")
                    TextField("Full name", text: $viewModel.userFullName)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    
                    if viewModel.userFullName.trimmingCharacters(in: .whitespaces).count > 4 {
                            Image(systemName: "checkmark")
                                .foregroundStyle(Color.green)
                    }
                
                }
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                }
                
                //Email
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $viewModel.userEmail)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    
                    if !viewModel.userEmail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        
                        if viewModel.userEmail.contains("@") && viewModel.userEmail.contains(".") {
                            
                            Image(systemName: "checkmark")
                                .foregroundStyle(Color.green)
                            
                        }
                        
                    }
                
                }
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                }
                
                //Password
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password", text: $viewModel.userPassword)
                    
                    if viewModel.userPassword.count >= 8 {
                        Image(systemName: "checkmark")
                            .foregroundStyle(Color.green)
                    }
                }
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                }
                
                //Confirm Password
                HStack{
                    Image(systemName: "lock")
                    SecureField("Confirm Password", text: $viewModel.userConfirmPassword)
                    
                    if viewModel.userPassword == viewModel.userConfirmPassword && viewModel.userConfirmPassword.count >= 8 {
                        Image(systemName: "checkmark")
                            .foregroundStyle(Color.green)
                    }
                }
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                }
                
                
                // Already Have an Account?
                HStack{
                    Button(action: {
                        
                        withAnimation {
                            authViewModel.changeCurrentViewtoLogin()
                        }
                        
                        
                    }, label: {
                        Text("Already Have an Account ?")
                            .foregroundStyle(Color.black)
                            .opacity(0.6)
                    })
                }
                .padding(.top)
                
                Spacer()
                Spacer()
                
                Button(action: {
                    
                    viewModel.registerNewUserwithEmail()
                    
                }, label: {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 50)
                            .foregroundStyle(Color.black)
                        
                        Text("Sign up")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 19))
                        
                    }
                    
                })
                
                
            }
            .padding()
            
        }
        
    }
}


#Preview {
    AuthView()
}
