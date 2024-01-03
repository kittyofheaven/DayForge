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
                    
                    HeadingView()
                    
                    
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
