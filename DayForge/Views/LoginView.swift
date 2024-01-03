//
//  LoginView.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
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
                    
                    if !viewModel.userPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Image(systemName: "checkmark")
                            .foregroundStyle(Color.green)
                    }
                }
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                }
                .font(.custom("Roboto-Regular", size: 16))
                
                // Dont Have an Account?
                HStack{
                    Button(action: {
                        
                        
                        withAnimation {
                            authViewModel.changeCurrentViewtoRegister()
                        }
                        
                        
                    }, label: {
                        Text("Don't Have an Account ?")
                            .foregroundStyle(Color.black)
                            .font(.custom("Roboto-Regular", size: 16))
                            .opacity(0.6)
                    })
                }
                .padding(.top)
                // Dont Have an Account?
                
                
                Spacer()
                Spacer()
                
                //Sign In Button
                Button(action: {
                    viewModel.signIn()
                }, label: {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 50)
                            .foregroundStyle(Color.black)
                        
                        Text("Sign in")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 19))
                        
                    }
                    
                })
                //Sign In Button
                
                
            }
            .padding()
            
        }
        
    }
}

#Preview {
        AuthView()
}
