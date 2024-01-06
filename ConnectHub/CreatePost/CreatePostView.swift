//
//  CreatePostView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 06/01/24.
//

import SwiftUI
extension CreatePostView {
    static func build(user: UserModel) -> CreatePostView {
        let router = CreatePostRouter()
        let interactor = CreatePostInteractor()
        let presenter = CreatePostPresenter(interactor: interactor, router: router, user: user)
        return CreatePostView(presenter: presenter)
    }
}
struct CreatePostView: View {
    @StateObject
    var presenter: CreatePostPresenter
    
    @State var isSelectionIconMode: Bool = false
    @EnvironmentObject
    var postData: PostData
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment: .leading,content: {
            HStack(alignment: .top,content: {
                Image(presenter.user.profilePicture)
                    .resizable()
                    .background(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .clipped()
                    .cornerRadius(100)
                    .contentShape(Circle())
                    .padding(.top)
                    .padding(.leading)
                
                VStack {
                    TextField(
                        "Comment",
                        text: $presenter.text,
                        prompt: Text("Please input your comment"),
                        axis: .vertical
                    )
                    .padding()
                    .background(Color(red: 0.45, green: 0.46, blue: 0.47))
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
                }
                .padding()
            })
            if let imageName = presenter.imageName {
                ZStack(alignment: .bottom) {
                    Image(imageName)
                        .resizable()
                        .frame(height: 300)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .imageScale(.medium)
                    
                    Button(action: {
                        presenter.imageName = nil
                    }, label: {
                        Text("Remove".uppercased())
                            .padding()
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                    .cornerRadius(100)
                    .background(.red.opacity(0.7))
                    .padding(.bottom, 24)
                }
            } else {
                HStack(alignment: .center, spacing: 12, content: {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: !isSelectionIconMode ? "plus" : "xmark")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    .background(Color(red: 0.09, green: 0.1, blue: 0.11))
                    .cornerRadius(30)
                    .padding(.leading)
                    .onTapGesture {
                        withAnimation {
                            isSelectionIconMode.toggle()
                        }
                    }
                    if isSelectionIconMode {
                        HStack(alignment: .center, spacing: 16) {
                            ForEach(ImageOptionsName, id: \.self) { option in
                                Image(option)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        isSelectionIconMode.toggle()
                                        presenter.imageName = option
                                    }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                        .cornerRadius(32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 32)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.2, green: 0.2, blue: 0.21), lineWidth: 1)
                        )
                    }
                })
            }
            Spacer()
        })
        .background(Color.black.opacity(0.7))
        .navigationTitle("CREATE")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if !isFormFilled { return }
                    let entity = PostEntity(
                        user: presenter.user,
                        text: presenter.text,
                        imageURL: presenter.imageName
                    )
                    postData.posts.insert(entity, at: 0)
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Publish")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                
            }
            ToolbarItem(placement: .topBarLeading) {
                btnBack
            }
        }
    }
    var isFormFilled: Bool {
        return !presenter.text.isEmpty || presenter.imageName != nil
    }
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.backward") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            Text("Discard")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
        }
    }
    }
}

#Preview {
    CreatePostView.build(user: UserModel(username: "Steve Jobs", profilePicture: "steve"))
}
