//
//  PostListView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

extension PostListView {
    static func build() -> PostListView {
        let router = PostListRouter()
        let interactor = PostListInteractor()
        let presenter = PostListPresenter(interactor: interactor, router: router)
        interactor.presenter = presenter
        return PostListView(presenter: presenter)
    }
}

struct PostListView: View {
    @ObservedObject
    var presenter: PostListPresenter
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing, content: {
                VStack(content: {
                    List(presenter.posts, id: \.id) { post in
                        PostView(post: post)
                            .background(.black)
                            .listRowInsets(EdgeInsets())
                    }
                    .background(.black)
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                })
                
                FloatingButtonView(action: {
                    presenter.addData(post: PostEntity(
                        user: presenter.user,
                        text: loremIpsum,
                        imageURL: nil)
                    )
                })
                .padding()
            })
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
    let router = PostListRouter()
    let interactor = PostListInteractor()
    let presenter = PostListPresenter(interactor: interactor, router: router)
    return PostListView(presenter: presenter)
}
