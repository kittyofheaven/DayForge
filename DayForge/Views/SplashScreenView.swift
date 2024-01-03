//
//  SplashScreenView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct SplashScreenView: View {
    @StateObject var viewModel = SplashScreenViewModel()
    
    var body: some View {
        
        if viewModel.isActive {
            ContentView()
        }
        
        else {
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("DAY.FORGE")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.custom("PaytoneOne-Regular", size: 55))
                    
                    
                    Text("Forge Your Path, Chronicle Your Journey Daily")
                        .opacity(0.5)
                        .font(.custom("Roboto-Regular", size: 16))
                    
                    
                    Spacer()
                    
                    Image("SplashScreenImage")
                        .resizable()
                        .edgesIgnoringSafeArea(.bottom)
                        .scaledToFit()
                    
                }
                .opacity(viewModel.opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        viewModel.opacity = 1.0
                    }
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    viewModel.isActive = true
                }
            }

        }
    }
    
//    init(){
//        for familyName in UIFont.familyNames {
//            print(familyName)
//            
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("-- \(fontName)")
//            }
//            
//        }
//    } // buat cari font name
    
    
}

#Preview {
    SplashScreenView()
}
