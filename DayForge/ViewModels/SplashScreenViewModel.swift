//
//  SplashScreenViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import Foundation

class SplashScreenViewModel: ObservableObject {
    @Published var isActive = false
    @Published var opacity = 0.5
    
    init() {}
}
