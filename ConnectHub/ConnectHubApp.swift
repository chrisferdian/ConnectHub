//
//  ConnectHubApp.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

@main
struct ConnectHubApp: App {
    
    let user = UserModel(name: "Steve Jobs", username: "steve", profilePicture: "steve")
    
    var body: some Scene {
        WindowGroup {
            PostListView.build()
//            RouterView(content: PostListView.build)
        }
    }
}
