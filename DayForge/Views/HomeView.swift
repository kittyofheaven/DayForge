//
//  HomeView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello, User!")
                    .font(.title)
                Text("How do you feel today?")
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
