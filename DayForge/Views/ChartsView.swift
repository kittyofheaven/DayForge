//
//  ChartsView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI
import Charts

struct LeftAligned: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
        }
    }
}

extension View {
    func leftAligned() -> some View {
        return self.modifier(LeftAligned())
    }
}

struct ChartsView: View {
    @ObservedObject var viewModel = ChartsViewModel()
    
    var body: some View {
        NavigationView {
            HStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("Mood Lately").leftAligned()
                            .font(.custom("Poppins-Regular", size: 31))
                        Text("Here are your 30 latest days' moods!").leftAligned()
                            .font(.custom("Poppins-Regular", size: 14))
                            .padding(.bottom)
                        Chart{
                            ForEach(viewModel.thirtyMood()) { mood in
                                LineMark(x: .value("", viewModel.thirtyMood().firstIndex(of: mood) ?? 0),
                                         y: .value("Mood", mood.mood))
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Smoking Lately").leftAligned()
                            .font(.custom("Poppins-Regular", size: 31))
                        Text("Here are your 30 latest days' cigar you smoked!").leftAligned()
                            .font(.custom("Poppins-Regular", size: 14))
                            .padding(.bottom)
                        Chart{
                            ForEach(viewModel.thirtyMood()) { mood in
                                LineMark(x: .value("", viewModel.thirtyMood().firstIndex(of: mood) ?? 0),
                                         y: .value("Mood", mood.smoke))
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Alcohol Lately").leftAligned()
                            .font(.custom("Poppins-Regular", size: 31))
                        Text("Here are your 30 latest days' alcohol you drank!").leftAligned()
                            .font(.custom("Poppins-Regular", size: 14))
                            .padding(.bottom)
                        Chart{
                            ForEach(viewModel.thirtyMood()) { mood in
                                LineMark(x: .value("", viewModel.thirtyMood().firstIndex(of: mood) ?? 0),
                                         y: .value("Mood", mood.alcohol))
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Selfharm Lately").leftAligned()
                            .font(.custom("Poppins-Regular", size: 31))
                        Text("Here are your 30 latest days' selfharm you did!").leftAligned()
                            .font(.custom("Poppins-Regular", size: 14))
                            .padding(.bottom)
                        Chart{
                            ForEach(viewModel.thirtyMood()) { mood in
                                LineMark(x: .value("", viewModel.thirtyMood().firstIndex(of: mood) ?? 0),
                                         y: .value("Mood", mood.selfharm))
                            }
                        }
                    }
                    .padding(.bottom)
                    
                }
                .padding()
                .navigationTitle("Charts")
            }
            
            .background {
                Image("ChartsBg")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
                    .scaledToFit()
            }
            
        }
        
        .onAppear {
            viewModel.fetchData()
        }
        
    }
    
    
    init(){
        viewModel.fetchData()
    }
}

#Preview {
    ChartsView()
}
