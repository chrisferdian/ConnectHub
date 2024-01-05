//
//  PostListPresenter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import Foundation

class PostListPresenter: ObservableObject {
    var interactor: PostListInteractor
    var router: PostListRouterProtocol
    @Published var posts: [PostEntity] = []

    init(interactor: PostListInteractor!, router: PostListRouterProtocol!) {
        self.interactor = interactor
        self.router = router
    }
    func addData(post: PostEntity) {
        posts.insert(post, at: 0)
    }
    func fetchPosts() {
        
    }
}
