//
//  ConnectHelper.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import Foundation
class ConnectHelper {
    static var shared = ConnectHelper()
    
    func getUsers() async -> [UserModel] {
        return [
            UserModel(name: "Steve Jobs", username: "steve", profilePicture: "steve"),
            UserModel(name: "Bill Gates", username: "bill", profilePicture: "bill"),
            UserModel(name: "Sundar Pichai", username: "sundar", profilePicture: "sundar")
        ]
    }
}
