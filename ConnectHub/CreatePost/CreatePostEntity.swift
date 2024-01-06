//
//  CreatePostEntity.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import Foundation

// Predefined image names for image selection options.
let ImageOptionsName = [
    "img1",
    "img2",
    "img3",
    "img4"
]

// Data structure representing the content of a post being created.
struct CreatePostEntity {
    // Text content of the post.
    var text: String?
    // Image name for the post.
    var imageName: String?
}

