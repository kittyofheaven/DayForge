//
//  FirstWelcomePage.swift
//  DayForge
//
//  Created by Hana Azizah on 15/01/24.
//

import SwiftUI

struct FirstWelcomePageView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("FirstWelcomePage")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Image("VectorOne")
            
            Spacer()
            
            VStack {
                Text("Welcome")
                    .font(.custom("PaytoneOne-Regular", size: 36))
                Text("Welcome to the art of mindful journaling. Every entry is a stroke on the canvas of your inner self")
                    .multilineTextAlignment(.center)
                    .font(.custom("Poppins-Regular", size: 13))
                    .padding(.horizontal, 50)
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    authViewModel.changeCurrentViewtoSecondWelcomePage()
                    
                }
            } label: {
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
    FirstWelcomePageView(authViewModel: AuthViewModel())
}
