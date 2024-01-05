//
//  PostListView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject
    var presenter: PostListPresenter
    let users = ["Steve", "Bill"]
    @State private var selection = "Steve"
    
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
                    presenter.addData(post: .init(username: selection, text: loremIpsum, imageURL: selection == "Steve" ? "arcade.stick.console.fill" : nil))
                })
                .padding()
            })
            .background(Color.black)
            .navigationTitle("Connect Hub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("Select a user", selection: $selection) {
                        ForEach(users, id: \.self) {
                            Text($0)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(.menu)
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
