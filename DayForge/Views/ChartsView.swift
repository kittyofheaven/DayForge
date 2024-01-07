//
//  ChartsView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI

struct ChartsView: View {
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Text("Mood 1")
                    Text("Mood 2")
                    
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Charts")
        }
    }
}

#Preview {
    ChartsView()
}
