//
//  JournalModel.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import Foundation

struct Journal: Codable {
    let id: String
    let uid: String
    let title: String
    let content: String
    let updated: TimeInterval
}
