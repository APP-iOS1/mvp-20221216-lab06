//
//  PhotoPostView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/20.
//

import SwiftUI
import Firebase

struct PhotoPostView: View {
    @StateObject var commentStore: CommentStore
    
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
            
            ForEach(commentStore.comments) { comment in
                Text(comment.content)
            }
            
            HStack {
                TextField("comment", text: $content)
                Button {
                    let comment: Comment = Comment(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), content: content, createdDate: Timestamp())
                    commentStore.addComment(comment)
                    content = ""
                } label: {
                    Text("add")
                }
            }
        }.onAppear {
            commentStore.postId = photoPost.id
            commentStore.fetchComment()
        }
        
    }
}


//struct PhotoPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoPostView(photoPost: PhotoPost().photos.first!)
////            .environmentObject(PhotoPostStore())
//    }
//}


