//
//  PostListEntities.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import Foundation

class PostData: ObservableObject {
    // Published property for the array of posts.
    @Published var posts: [PostEntity] = []
}
