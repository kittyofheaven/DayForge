//
//  HomeView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            HStack {
                ScrollView {
                    Text("Content")
                }
            }
            .navigationTitle("Welcome Home!")
        }
    }
}

#Preview {
    HomeView()
}
