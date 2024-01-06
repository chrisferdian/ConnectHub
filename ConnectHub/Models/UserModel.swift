//
//  UserModel.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import Foundation
struct UserModel: Hashable {
    // Full name of the user.
    var name: String
    // Unique username for identification.
    var username: String
    // URL or identifier for the user's profile picture.
    var profilePicture: String
    
    // Initialize the UserModel with the provided values.
    init(name: String, username: String, profilePicture: String) {
        self.name = name
        self.username = username
        self.profilePicture = profilePicture
    }
}
