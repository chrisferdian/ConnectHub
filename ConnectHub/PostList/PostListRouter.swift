//
//  PostListRouter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

// Protocol defining the navigation methods for the PostListRouter.
protocol PostListRouterProtocol: AnyObject {
    func navigateToPostForm() -> AppRoute
}

// Concrete implementation of the PostListRouterProtocol.
class PostListRouter: PostListRouterProtocol {
    
    // Navigate to the post creation form and return the corresponding AppRoute.
    func navigateToPostForm() -> AppRoute {
        return .createPost
    }
}
