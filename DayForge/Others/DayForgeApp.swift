//
//  DayForgeApp.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI
import FirebaseCore

@main
struct DayForgeApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}

