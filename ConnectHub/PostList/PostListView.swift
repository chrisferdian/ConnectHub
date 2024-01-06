//
//  PostListView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

extension PostListView {
    static func build() -> PostListView {
        let postData = PostData()
        let router = PostListRouter()
        let interactor = PostListInteractor()
        let presenter = PostListPresenter(interactor: interactor, router: router, postData: postData)
        interactor.presenter = presenter
        let view = PostListView(presenter: presenter)
        return view
    }
}

struct PostListView: View {
    @ObservedObject var presenter: PostListPresenter

    var body: some View {
        NavigationStack(path: $presenter.path) {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    List(presenter.postData.posts, id: \.id) { post in
                        PostView(post: post)
                            .background(.black)
                            .listRowInsets(EdgeInsets())
                    }
                    .background(.black)
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                }
                
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("User", selection: $presenter.user) {
                        ForEach(users, id: \.self) {
                            Text($0.username)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.white)
                }
            }
        }
    }
}


#Preview {
    return PostListView.build()
}
