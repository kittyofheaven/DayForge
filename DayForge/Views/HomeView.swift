//
//  HomeView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct HomeView: View {
//    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationView {
            HStack {
                    
                VStack(){
                    Spacer()
                    
                    HStack {
                        Text("Here some tips from us")
                            .font(.custom("Poppins-Regular", size: 16))
                        Spacer()
                    }
                    .padding(.horizontal)
                
                    Text("Engage in regular exercise, even if it's just a short walk. Physical activity has been linked to improvements in mood and can help reduce symptoms of depression.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .frame(width: 320)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3)
                        }
                    
                    Text("Share your feelings with someone you trust, whether it's a friend, family member, or mental health professional. Talking about your emotions can be a crucial step in getting help.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .frame(width: 320)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3)
                        }
                    
                    
                }
            }
            .padding()
            .navigationTitle("Welcome Home!")
        }
    }
}

#Preview {
    HomeView()
}
