//
//  CreatePostPresenter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import SwiftUI

class CreatePostPresenter: ObservableObject {
    // Reference to the interactor for business logic.
    weak var interactor: CreatePostInteractor?
    
    // Router for navigation.
    var router: CreatePostRouter

    // User information for the post.
    @Published var user: UserModel
    // Text content of the post.
    @Published var text: String = ""
    // Image name for the post.
    @Published var imageName: String?
    
    // Flag to toggle between image selection icons.
    @Published var isSelectionIconMode: Bool = false

    // Initialize the presenter with dependencies.
    init(interactor: CreatePostInteractor? = nil, router: CreatePostRouter, user: UserModel) {
        self.interactor = interactor
        self.router = router
        self.user = user
    }
}
