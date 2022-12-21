//
//  PhotoPostView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/20.
//

import SwiftUI
import Firebase

struct PhotoPostView: View {
    @StateObject var photoCommentStore: PhotoCommentStore
    
    var photoPost: PhotoPost
    @State var content: String = ""
    
    var body: some View {
        VStack {
            Text("\(photoPost.content)")
            Divider()
            
            ForEach(photoPost.photos, id: \.self) {photo in
                AsyncImage(url: URL(string: photo)) { image in
                                  image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
                .onAppear {
                    print(photo)
                }
            }
            
            Divider()
            
            ForEach(photoCommentStore.photocomments, id: \.id) { comment in
                Text(comment.photoCommentContent)
            }
            
            HStack {
                TextField("comment", text: $content)
                Button {
                    let photoComments: PhotoComments = PhotoComments(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), photoCommentContent: content, photoCommentCreatedDate: Timestamp())
                    photoCommentStore.addPhotoComment(photoComments)
                    content = ""
                } label: {
                    Text("add")
                }
            }
        }.onAppear {
            photoCommentStore.postId = photoPost.id
            photoCommentStore.fetchPhotoComment()
        }
        
    }
}


//struct PhotoPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoPostView(photoPost: PhotoPost().photos.first!)
////            .environmentObject(PhotoPostStore())
//    }
//}


