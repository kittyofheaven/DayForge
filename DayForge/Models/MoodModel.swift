//
//  MoodModel.swift
//  DayForge
//
//  Created by Hana Azizah on 08/01/24.
//

import Foundation

struct Mood: Codable {
    let id: String
    let mood: Int
    let smoke: Int
    let alcohol: Int
    let selfharm: Int
    let added: TimeInterval
}
