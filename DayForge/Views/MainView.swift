//
//  MainView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI

struct MainView: View {
//    @ViewBuilder
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "book.closed")
                }
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "questionmark.circle")
                }
            ChartsView()
                .tabItem {
                    Label("Charts", systemImage: "chart.line.downtrend.xyaxis")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
