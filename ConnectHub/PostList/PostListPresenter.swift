//
//  PostListPresenter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

class PostListPresenter: ObservableObject {
    
    weak var interactor: PostListInteractor?
    var router: PostListRouter
    
    @Published
    var posts: [PostEntity] = []
    @Published
    var user: UserModel = UserModel(username: "Steve Jobs", profilePicture: "steve")

    @Published var path = NavigationPath()

    init(interactor: PostListInteractor, router: PostListRouter) {
        self.interactor = interactor
        self.router = router
    }
    func addData(post: PostEntity) {
        posts.insert(post, at: 0)
    }
    func navigateToCreatePost() {
        path.append(router.navigateToPostForm())
    }
    func backToRoot() {
        path.removeLast()
    }
}
