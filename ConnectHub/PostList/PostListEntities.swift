//
//  PostListEntities.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import Foundation
let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

struct PostEntity {
    var id: UUID = UUID()
    var username: String
    var text: String?
    var imageURL: String?
}
