//
//  PostListPresenter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

class PostListPresenter: ObservableObject {
    
    weak var interactor: PostListInteractor?
    var router: PostListRouterProtocol
    
    @Published
    var posts: [PostEntity] = []
    @Published
    var user: UserModel = UserModel(username: "Steve Jobs", profilePicture: "steve")
    @State
    var selectedUserIndex = 0

    init(interactor: PostListInteractor, router: PostListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    func addData(post: PostEntity) {
        posts.insert(post, at: 0)
    }
}
