//
//  CommunityCommentStore.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/25.
//
import SwiftUI
import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
/*
 struct CommunityComments {
     var id: String
     var userID: String
     var communityCommentContent: String
     var communityCommentCreatedDate: Timestamp
 }
 */

class CommunityCommentStore: ObservableObject {
    
    let database = Firestore.firestore()
    var postId: String = ""
    @Published var communityComments: [CommunityComments]
    
    init() {
        communityComments = []
    }
    
    /*var id: String
     var userId: String
     var content: String*/
    func fetchCommunityComment() {
        database.collection("CommunityPost").document(postId).collection("CommunityComments")
            .order(by: "communityCommentCreatedDate")
            .getDocuments { (snapshot, error) in
                self.communityComments.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        
                        let id: String = document.documentID
                        let docData = document.data()
                        let userID: String = docData["userID"] as? String ?? ""
                        let communityCommentContent: String = docData["communityCommentContent"] as? String ?? ""
                        let communityCommentCreatedDate: Timestamp = docData["communityCommentCreatedDate"] as? Timestamp ?? Timestamp(date: Date())
                        
                        let communityComment: CommunityComments = CommunityComments(id: id, userID: userID, communityCommentContent: communityCommentContent, communityCommentCreatedDate: communityCommentCreatedDate)

                        self.communityComments.append(communityComment)
                    }
                }
            }
    }
    
    func addCommunityComment(_ communityComment: CommunityComments) {
        database.collection("CommunityPost").document(postId).collection("CommunityComments")
            .document(communityComment.id)
            .setData(["userID": communityComment.userID,
                      "communityCommentContent": communityComment.communityCommentContent,
                      "communityCommentCreatedDate": communityComment.communityCommentCreatedDate,
                     ])
        fetchCommunityComment()
    }
    
    func removeCommunityComment(_ communityComment: CommunityComments) {
        database.collection("CommunityPost").document(postId).collection("CommunityComments")
            .document(communityComment.id)
            .delete()
        fetchCommunityComment()
    }

}
