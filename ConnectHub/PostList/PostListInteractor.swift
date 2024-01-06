//
//  PostListInteractor.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import Foundation
// Interactor
class PostListInteractor {
    // Weak reference to the presenter to avoid strong reference cycles.
    weak var presenter: PostListPresenter?
    
    // Asynchronously fetches the user list and notifies the presenter.
    func getUserList() async {
        // Use ConnectHelper to asynchronously get the list of users.
        let list = await ConnectHelper.shared.getUsers()
        
        // Notify the presenter with the retrieved user list.
        presenter?.presentUsers(with: list)
    }
}
