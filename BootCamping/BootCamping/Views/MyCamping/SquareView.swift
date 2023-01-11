//
//  SquareView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI

struct SquareView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @StateObject var photoPostStore: PhotoPostStore
    @StateObject var photoCommentStore: PhotoCommentStore = PhotoCommentStore()
    @State private var currentURL: URL?
    @Binding var tabSelection: Tab
    var user: Users

    
    var body: some View {
            VStack {
                LazyVGrid(columns: columns) {
                    
                    ForEach(photoPostStore.photoPost.filter { $0.userID == Auth.auth().currentUser?.uid }, id: \.id) { photo in
                        if photo.photos.count == 0 {
                            EmptyPostView(tabSelection: $tabSelection)
                        } else {
                            NavigationLink(destination: ArticleDetailView(photoPost: photo, photoCommentStore: photoCommentStore, user: user)) {
                                WebImage(url: URL(string: photo.photos.first ?? ""))
                                    .resizable()
                                    .frame(width: 198, height: 198)
                                    .padding(.bottom, -9)
                                
                                
//                                AsyncImage(url: URL(string: photo.photos.first ?? "")) { image in
//                                    image
//                                        .resizable()
//                                } placeholder: {
//                                    ProgressView()
//                                }
//                                .frame(width: 198, height: 198)
//                                .padding(.bottom, -9)
                            }
                        }
                    }
                }
                .onAppear{
                    photoPostStore.fetchPhotoPost()
                    photoPostStore.retrievePhotos()
                }
            }
            .padding(.bottom)
        }
}



struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(photoPostStore: PhotoPostStore(), tabSelection: .constant(.third), user: AuthStore().userList.first!)
    }
}
