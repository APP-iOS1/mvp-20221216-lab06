//
//  CommentStore.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class PhotoCommentStore: ObservableObject {
    
    let database = Firestore.firestore()
    var postId: String = ""
    @Published var photocomments: [PhotoComments]
    
    init() {
        photocomments = []
    }
    
    /*var id: String
     var userId: String
     var content: String*/
    func fetchPhotoComment() {
        database.collection("PhotoPost").document(postId).collection("PhotoComments")
            .order(by: "photoCommentCreatedDate")
            .getDocuments { (snapshot, error) in
                self.photocomments.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        
                       
                        let id: String = document.documentID
                        let docData = document.data()
                        let userID: String = docData["userID"] as? String ?? ""
                        let photoCommentContent: String = docData["photoCommentContent"] as? String ?? ""
                        let photoCommentCreatedDate: Timestamp = docData["photoCommentCreatedDate"] as? Timestamp ?? Timestamp(date: Date())
                        
                        let photoComment: PhotoComments = PhotoComments(id: id, userID: userID, photoCommentContent: photoCommentContent, photoCommentCreatedDate: photoCommentCreatedDate)
                        
                        self.photocomments.append(photoComment)
                    }
                }
            }
    }
    
    func addPhotoComment(_ photoComment: PhotoComments) {
        database.collection("PhotoPost").document(postId).collection("PhotoComments")
            .document(photoComment.id)
            .setData(["userID": photoComment.userID,
                      "photoCommentContent": photoComment.photoCommentContent,
                      "photoCommentCreatedDate": photoComment.photoCommentCreatedDate,
                     ])
        fetchPhotoComment()
    }
    
    func removePhotoComment(_ photoComment: PhotoComments) {
        database.collection("PhotoPost").document(postId).collection("PhotoComments")
            .document(photoComment.id)
            .delete()
        fetchPhotoComment()
    }

}
