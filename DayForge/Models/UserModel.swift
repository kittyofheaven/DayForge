//
//  UserModel.swift
//  simpleLoginPage
//
//  Created by Hazel Handrata on 03/01/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
