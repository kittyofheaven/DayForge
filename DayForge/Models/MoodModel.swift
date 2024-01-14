//
//  MoodModel.swift
//  DayForge
//
//  Created by Hana Azizah on 08/01/24.
//

import Foundation

struct Mood: Codable, Identifiable, Equatable {
    let id: String
    let mood: Int
    let smoke: Int
    let alcohol: Int
    let selfharm: Int
    let added: TimeInterval
    
    
    func dayAndDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            
            let date = Date(timeIntervalSince1970: added)
            return dateFormatter.string(from: date)
    }
}
