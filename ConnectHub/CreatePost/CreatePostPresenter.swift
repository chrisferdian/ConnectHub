//
//  CreatePostPresenter.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import SwiftUI

class CreatePostPresenter: ObservableObject {
    weak var interactor: CreatePostInteractor?
    var router: CreatePostRouter
    
    @Published
    var user: UserModel
    @Published var text: String = ""
    @Published var imageName: String?
    
    @Published var isSelectionIconMode: Bool = false
    
    init(interactor: CreatePostInteractor? = nil, router: CreatePostRouter, user: UserModel) {
        self.interactor = interactor
        self.router = router
        self.user = user
    }
//    init(interactor: CreatePostInteractor? = nil, router: CreatePostRouter) {
//        self.interactor = interactor
//        self.router = router
//    }
}
