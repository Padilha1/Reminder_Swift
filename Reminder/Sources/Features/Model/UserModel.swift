//
//  UserModel.swift
//  Reminder
//
//  Created by Matheus Padilha on 09/06/25.
//

import Foundation

struct User: Codable {
    let email: String
    let isUserSaved: Bool
}
