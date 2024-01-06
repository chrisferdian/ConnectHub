//
//  ConnectHelper.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import Foundation
// Helper class for providing data related functionalities.
class ConnectHelper {
    
    // Singleton instance for shared access to ConnectHelper functionalities.
    static var shared = ConnectHelper()
    
    // Asynchronously retrieves dummy user data for testing.
    func getUsers() async -> [UserModel] {
        return [
            UserModel(name: "Steve Jobs", username: "steve", profilePicture: "steve"),
            UserModel(name: "Bill Gates", username: "bill", profilePicture: "bill"),
            UserModel(name: "Sundar Pichai", username: "sundar", profilePicture: "sundar")
        ]
    }
}
