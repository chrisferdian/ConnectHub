//
//  PostEntity.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import Foundation
struct PostEntity {
    // Unique identifier for the post.
    var id: UUID = UUID()
    // User who created the post.
    var user: UserModel
    // Optional text content of the post.
    var text: String?
    // Optional URL for an image associated with the post.
    var imageURL: String?
    // Number of likes the post has received.
    var likes: Int = 0
    // Number of comments on the post.
    var comments: Int = 0
    // Number of shares the post has received.
    var shares: Int = 0
    
    // Initialize the PostEntity with the provided values.
    init(id: UUID = UUID(), user: UserModel, text: String? = nil, imageURL: String? = nil) {
        self.id = id
        self.user = user
        self.text = text
        self.imageURL = imageURL
    }
}
