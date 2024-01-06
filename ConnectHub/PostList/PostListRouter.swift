//
//  PostListRouter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

// Router
protocol PostListRouterProtocol: AnyObject {
    func navigateToPostForm() -> AppRoute
}
class PostListRouter: PostListRouterProtocol {
    
    func navigateToPostForm() -> AppRoute {
        return .createPost
    }
}
