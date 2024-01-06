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
    var postData: PostData

    @Published var user: UserModel = UserModel(name: "Steve Jobs", username: "steve", profilePicture: "steve")
    @Published var path = NavigationPath()

    init(interactor: PostListInteractor? = nil, router: PostListRouter, postData: PostData) {
        self.interactor = interactor
        self.router = router
        self.postData = postData
        self.user = user
        self.path = path
    }
    func addData(post: PostEntity) {
        postData.posts.insert(post, at: 0)
    }
    func navigateToCreatePost() {
        path.append(router.navigateToPostForm())
    }
    func backToRoot() {
        path.removeLast(path.count)
    }
}
