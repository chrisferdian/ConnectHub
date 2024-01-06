//
//  PostListView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

extension PostListView {
    // A static method to build and return an instance of PostListView with default data.
    static func build() -> PostListView {
        let postData = PostData()
        let user = UserModel(name: "Steve Jobs", username: "steve", profilePicture: "steve")

        let router = PostListRouter()
        let interactor = PostListInteractor()
        let presenter = PostListPresenter(interactor: interactor, router: router, postData: postData, user: user)
        interactor.presenter = presenter
        return PostListView(presenter: presenter)
    }
}

struct PostListView: View {
    // ObservedObject that holds the presenter responsible for managing the view's data and interactions.
    @ObservedObject var presenter: PostListPresenter

    var body: some View {
        // NavigationStack to manage the navigation path of the view.
        NavigationStack(path: $presenter.path) {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    // List displaying posts with a black background and hidden separators.
                    List(presenter.postData.posts, id: \.id) { post in
                        PostView(post: post)
                            .background(.black)
                            .listRowInsets(EdgeInsets())
                    }
                    .background(.black)
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                }
                
                // Floating button for creating a new post, with navigation to the CreatePostView.
                FloatingButtonView {
                    presenter.navigateToCreatePost()
                }
                .padding()
                .navigationDestination(for: AppRoute.self) { routes in
                    CreatePostView.build(user: presenter.user)
                        .environmentObject(presenter.postData)
                }
            }
            .background(Color.black)
            .navigationTitle("Connect Hub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Toolbar item for selecting a user from a Picker.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("User", selection: $presenter.user) {
                        ForEach(presenter.users, id: \.self) {
                            Text($0.username.usernameFormat)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.white)
                }
            }
            .onAppear {
                // Asynchronously fetch the user list when the view appears.
                Task(priority: .high) {
                    await presenter.interactor?.getUserList()
                }
            }
        }
    }
}


#Preview {
    return PostListView.build()
}
