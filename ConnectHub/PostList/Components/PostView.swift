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
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: .infinity, height: 180)
                          .background(
                            Image(systemName: imageName)
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 327, height: 180)
                              .foregroundColor(.white)
                              .clipped()
                          )
                          .cornerRadius(16)
                    }
                    
                    if let _text = post.text {
                        Text(_text)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.93))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.horizontal, 16)
                    }

                    postActionWrapper
                        .padding(.horizontal, 16)
                    
                    Divider()
                        .background(.gray)
                }
                .padding(0)
                .frame(width: .infinity, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(0)
        .background(.black)
        .frame(width: .infinity, alignment: .center)
    }
    var postActionWrapper: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 20) { 
                //MARK: LIKE
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "hand.thumbsup")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    Text("2,245")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                //MARK: COMMENTS
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "ellipsis.message")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    Text("2,245")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
                
                //MARK: SHARE
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    Text("2,245")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(0)
            }
            .padding(0)
            Image("bookmark")
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(0)
        .padding(.bottom, 16)
        .frame(width: .infinity, alignment: .center)
    }
    var profileInfoWrapper: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 8) {
                Image("steve")
                    .resizable()
                    .background(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .clipped()
                    .cornerRadius(100)
                    .contentShape(Circle())    // <- Here!

                VStack(alignment: .leading, spacing: 2) {
                    Text(post.username)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.93))
                    
                    Text("1d ago")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(red: 0.45, green: 0.46, blue: 0.47))
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

#Preview {
    PostView(post: .init(username: "", text: "", imageURL: "flag.and.flag.filled.crossed"))
        .background(Color.black)
}
