//
//  ContentView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/16.
//

import SwiftUI
import FirebaseAuth

//enum tapInfo : String, CaseIterable {
//    case top = "오늘의 캠핑"
//    case follow = "팔로우중인 캠퍼"
//}

struct ContentView: View {
    
    @StateObject var photoPostStore: PhotoPostStore = PhotoPostStore()

    @EnvironmentObject var authStore: AuthStore
    
    @StateObject var commentStore = CommentStore()
    
    var body: some View {
        List {
            Button {
                Task {
                    try await authStore.signOut()
                }
            } label: {
                Text("signout")
            }
            
            ForEach(photoPostStore.photoPost.filter { $0.userID == Auth.auth().currentUser?.uid }, id: \.id) { post in
                NavigationLink {
                    PhotoPostView(commentStore: commentStore, photoPost: post)
                } label: {
                    Text("\(post.title)")
                }
            }
            
        }
        .navigationTitle("List")
        .toolbar {
            NavigationLink {
                WriteView(photoPostStore: photoPostStore)
            } label: {
                Text("Add")
            }
        }
        .onAppear {
            print(Auth.auth().currentUser?.uid)
            
            photoPostStore.fetchPhotoPost()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthStore())
    }
}
