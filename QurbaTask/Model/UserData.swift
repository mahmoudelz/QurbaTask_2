//
//  userData.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 11/03/2023.
//

import Foundation

// This struct handle the User Data recieved from the API

struct UserResults: Decodable {
    let users: [UserData]
}

struct UserData: Decodable {
    var id: Int
    var username: String
    var email: String
    var firstName: String
    var lastName: String
}
