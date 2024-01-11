//
//  ChartsView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI
import Charts

struct ChartsView: View {
    @ObservedObject var viewModel = ChartsViewModel()
    
    var body: some View {
        NavigationView {
            HStack {
                Text(viewModel.returnString())
                
                ScrollView {
                    
                    ForEach(viewModel.moods) { mood in
                        Text(mood.dayAndDate())
                    }
                
                    
                    
                }
                .padding()
                Spacer()
            }
            .background {
                Image("ChartsBg")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
                    .scaledToFit()
            }
            .navigationTitle("Charts")
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
