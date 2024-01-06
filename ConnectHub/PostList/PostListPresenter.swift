//
//  PostListPresenter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

class PostListPresenter: ObservableObject {
    // Interactor responsible for business logic.
    var interactor: PostListInteractor?
    
    // Router for navigation.
    var router: PostListRouter
    
    // Data model for posts.
    var postData: PostData

    // The currently logged-in user.
    var user: UserModel
    
    // Published property for the list of users.
    @Published var users: [UserModel] = []
    
    // Published property for navigation path.
    @Published var path = NavigationPath()

    // Initialize the presenter with dependencies.
    init(interactor: PostListInteractor? = nil, router: PostListRouter, postData: PostData, user: UserModel) {
        self.interactor = interactor
        self.router = router
        self.postData = postData
        self.user = user
    }
    
    // Add a post to the data model.
    func addData(post: PostEntity) {
        postData.posts.insert(post, at: 0)
    }
    
    // Navigate to the post creation form.
    func navigateToCreatePost() {
        path.append(router.navigateToPostForm())
    }
    
    // Navigate back to the root of the navigation path.
    func backToRoot() {
        path.removeLast(path.count)
    }
    
    // Notify the presenter with the retrieved user list.
    func presentUsers(with list: [UserModel]) {
        DispatchQueue.main.async {
            self.users = list
        }
    }
}
