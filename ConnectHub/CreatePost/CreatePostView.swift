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
    // Presenter for creating posts.
    @StateObject
    var presenter: CreatePostPresenter
    
    // Shared data across views.
    @EnvironmentObject
    var postData: PostData
    
    // To dismiss the view.
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading,content: {
            // User profile image and text input field.
            fieldWrapper
            if let _ = presenter.imageName {
                // Display selected image with option to remove.
                selectedImageWrapper
            } else {
                // Display image selection options.
                selectionImageWrapper
            }
            Spacer()
        })
        .background(Color.black.opacity(0.7))
        .navigationTitle("CREATE")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                // Publish button to add the post to the data model.
                publishButton
            }
            ToolbarItem(placement: .topBarLeading) {
                // Discard button to dismiss the view.
                backButton
            }
        }
    }
    
    // View for displaying the selected image.
    var selectedImageWrapper: some View {
        ZStack(alignment: .bottom) {
            Image(presenter.imageName!)
                .resizable()
                .frame(height: 300)
                .foregroundColor(.white)
                .padding(.horizontal)
                .imageScale(.medium)
            
            // Button to remove the selected image.
            Button(action: {
                presenter.imageName = nil
            }, label: {
                Text("Remove".uppercased())
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
            })
            .cornerRadius(100)
            .background(Color.red.opacity(0.7))
            .padding(.bottom, 24)
        }
    }
    
    // View for displaying image selection options.
    var selectionImageWrapper: some View {
        HStack(alignment: .center, spacing: 12, content: {
            HStack(alignment: .center, spacing: 10) {
                // Toggle between "+" and "x" icons for image selection.
                Image(systemName: !presenter.isSelectionIconMode ? "plus" : "xmark")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .padding(8)
            .background(Color(red: 0.09, green: 0.1, blue: 0.11))
            .cornerRadius(30)
            .padding(.leading)
            .onTapGesture {
                withAnimation {
                    presenter.isSelectionIconMode.toggle()
                }
            }
            
            // Display image selection options when in selection mode.
            if presenter.isSelectionIconMode {
                selectedImageOptions
            }
        })
    }
    
    // View for the text input field and user profile image.
    var fieldWrapper: some View {
        HStack(alignment: .top,content: {
            Image(presenter.user.profilePicture)
                .resizable()
                .background(Color.gray)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(100)
                .contentShape(Circle())
                .padding(.top)
                .padding(.leading)
            
            // Text input field for the post.
            VStack {
                TextField(
                    "Comment",
                    text: $presenter.text,
                    prompt: Text("What's on your mind?"),
                    axis: .vertical
                )
                .padding()
                .background(Color(red: 0.45, green: 0.46, blue: 0.47))
                .foregroundColor(.white)
                .cornerRadius(5.0)
            }
            .padding()
        })
    }
    
    // Check if the form is filled with text or an image.
    var isFormFilled: Bool {
        return !presenter.text.isEmpty || presenter.imageName != nil
    }
    
    // Button to dismiss the view.
    var backButton : some View {
        Button(action: {
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
    
    // Button to add the post to the data model.
    var publishButton: some View {
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
    
    // View for displaying image selection options when in selection mode.
    var selectedImageOptions: some View {
        HStack(alignment: .center, spacing: 16) {
            ForEach(ImageOptionsName, id: \.self) { option in
                Image(option)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .onTapGesture {
                        presenter.isSelectionIconMode.toggle()
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
}

#Preview {
    CreatePostView.build(user: UserModel(name: "Steve Jobs", username: "steve", profilePicture: "steve"))
}
