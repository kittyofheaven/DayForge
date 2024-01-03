//
//  ContentView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        
        
        if userID.isEmpty {
            AuthView()
        } else {
            MainView()
        }
        
        
    }
}

#Preview {
    ContentView()
}
