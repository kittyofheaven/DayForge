//
//  JournalItemViewModel.swift
//  DayForge
//
//  Created by Hana Azizah on 09/01/24.
//

import Foundation

class JournalItemViewModel: ObservableObject{
    init(){}
    
    
    func unixToDate(unixTime: Double)-> [String]{
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime)).formatted(date: .abbreviated, time: .omitted)
        let dateSeperated = date.components(separatedBy: " ")
        return dateSeperated
    }
}
