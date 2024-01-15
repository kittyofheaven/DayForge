//
//  SecondWelcomePage.swift
//  DayForge
//
//  Created by Hana Azizah on 15/01/24.
//

import SwiftUI

struct SecondWelcomePageView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("SecondWelcomePage")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 41)
            
            Spacer()
            
            Image("VectorTwo")
            
            Spacer()
            
            VStack {
                Text("Welcome")
                    .font(.custom("PaytoneOne-Regular", size: 36))
                Text("Every people have their own journey, so let star your journey with us")
                    .multilineTextAlignment(.center)
                    .font(.custom("Poppins-Regular", size: 13))
                    .padding(.horizontal, 50)
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    authViewModel.changeCurrentViewtoLogin()
                }
            } label:{
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 88, height: 37)
                        .foregroundStyle(.black)
                    
                    Text("next")
                        .font(.custom("Poppins-Bold", size: 24))
                        .foregroundStyle(.white)
                }
            }
            .padding(.bottom, 42)
        }
        .padding()
    }
}

#Preview {
    SecondWelcomePageView(authViewModel: AuthViewModel())
}
