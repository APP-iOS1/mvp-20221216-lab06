//
//  CommentStore.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CommentStore: ObservableObject {
    
    let database = Firestore.firestore()
    var postId: String = ""
    @Published var comments: [Comment]
    
    init() {
        comments = []
    }
    
    /*var id: String
     var userId: String
     var content: String*/
    func fetchComment() {
        database.collection("PhotoPost").document(postId).collection("Comments")
            .getDocuments { (snapshot, error) in
                self.comments.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        let docData = document.data()
                        let userID: String = docData["userID"] as? String ?? ""
                        let content: String = docData["content"] as? String ?? ""
                        let createdDate: Timestamp = docData["createdDate"] as? Timestamp ?? Timestamp(date: Date())
                        
                        let comment: Comment = Comment(id: id, userID: userID, content: content, createdDate: createdDate)
                        
                        self.comments.append(comment)
                    }
                }
            }
    }
    
    func addComment(_ comment: Comment) {
        database.collection("PhotoPost").document(postId).collection("Comments")
            .document(comment.id)
            .setData(["userID": comment.userID,
                      "content": comment.content,
                      "createdDate": comment.createdDate,
                     ])
        fetchComment()
    }
}
