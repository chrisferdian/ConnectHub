//
//  PostListEntities.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import Foundation
let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

let users = [
    UserModel(username: "Steve Jobs", profilePicture: "steve"),
    UserModel(username: "Bill Gates", profilePicture: "bill"),
    UserModel(username: "Sundar Pichai", profilePicture: "sundar")
]

struct UserModel: Hashable {
    var username: String
    var profilePicture: String
    
    init(username: String, profilePicture: String) {
        self.username = username
        self.profilePicture = profilePicture
    }
}

struct PostEntity {
    var id: UUID = UUID()
    var user: UserModel
    var text: String?
    var imageURL: String?
    
    var likes: Int = 0
    var comments: Int = 0
    var shares: Int = 0
    
    init(id: UUID = UUID(), user: UserModel, text: String? = nil, imageURL: String? = nil) {
        self.id = id
        self.user = user
        self.text = text
        self.imageURL = imageURL
    }
}

class PostData: ObservableObject {
    @Published var posts: [PostEntity] = []
}
