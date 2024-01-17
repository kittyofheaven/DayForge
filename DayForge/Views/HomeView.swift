//
//  HomeView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationView {
            HStack {
                VStack{
                    Spacer()
                    
                    HStack {
                        Text("Here are some tips from us:")
                            .font(.custom("Poppins-Regular", size: 16))
                        Spacer()
                    }
                
                    VStack {
                        HStack {
                            Text("Engage in regular exercise, even if it's just a short walk.")
                                .font(.custom("Poppins-Bold", size: 18))
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        HStack {
                            Text("Regular exercise has been linked to mood improvements and can help reduce symptoms of depression.")
                                .font(.custom("Poppins-Regular", size: 16))
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(width: 345)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 3)
                    }
                    
                    VStack {
                        HStack {
                            Text("Share your feelings with someone you trust,")
                                .font(.custom("Poppins-Bold", size: 18))
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        HStack {
                            Text("whether it's a friend, family member, or mental health professional. Talking about your emotions can be a crucial step in getting help.")
                                .font(.custom("Poppins-Regular", size: 16))
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(width: 345)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 3)
                    }
                    
                    VStack {
                        Text("Get in contact with a personal psychologist")
                            .font(.custom("Poppins-Bold", size: 18))
                            .multilineTextAlignment(.center)
                        Button {
                            viewModel.showingPsychologistView = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 210, height: 37)
                                    .foregroundStyle(.black)
                                
                                Text("Choose a psychologist")
                                    .font(.custom("Poppins-Bold", size: 16))
                                    .foregroundStyle(.white)
                            }
                        }
                        .sheet(isPresented: $viewModel.showingPsychologistView, content: {
                            PsychologistView(newPagePresented: $viewModel.showingPsychologistView)
                        })
                    }
                    .frame(width: 345, height: 123)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 3)
                    }
                    
                }
            }
            .padding()
            .navigationTitle("Welcome Home!")
            
            .background {
                Image("ChartsBg")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
                    .scaledToFit()
            }
            
        }
    }
}

#Preview {
    HomeView()
}
