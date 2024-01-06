//
//  PostView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostEntity
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            VStack(alignment: .center, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    profileInfoWrapper
                        .padding(.horizontal, 16)
                    if let imageName = post.imageURL {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .foregroundColor(.white)
                            .clipped()
                            .cornerRadius(16)
                    }
                    
                    if let text = post.text {
                        Text(text)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(white: 0.92))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.horizontal, 16)
                    }
                    postActionWrapper
                        .padding(.horizontal, 16)
                    
                    Divider()
                        .background(.gray)
                }
            }
        }
        .background(.black)
    }
    var postActionWrapper: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 20) {
                //MARK: LIKE
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "hand.thumbsup")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    Text(post.likes.description)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                //MARK: COMMENTS
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "ellipsis.message")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    Text(post.comments.description)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                //MARK: SHARE
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    Text(post.shares.description)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
            }
            .padding(0)
            Spacer()
        }
        .padding(0)
        .padding(.bottom, 16)
    }
    var profileInfoWrapper: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 8) {
                Image(post.user.profilePicture)
                    .resizable()
                    .background(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .clipped()
                    .cornerRadius(100)
                    .contentShape(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.user.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.93))
                    Text(post.user.username.usernameFormat)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.93))
                }
                .padding(0)
            }
            .padding(0)
            Spacer()
            Image(systemName: "ellipsis")
                .frame(width: 24, height: 24)
                .rotationEffect(.init(degrees: 90))
                .foregroundColor(.gray)
        }
        .padding(0)
        .padding(.top, 16)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
extension String {
    var usernameFormat: String {
        return String(format: "@%@", self).lowercased()
    }
}
#Preview {
    PostView(post: PostEntity(
        user: .init(name: "Steve Jobs", username: "steve", profilePicture: "steve"),
        text: loremIpsum,
        imageURL: "img1")
    )
    .background(Color.black)
}
