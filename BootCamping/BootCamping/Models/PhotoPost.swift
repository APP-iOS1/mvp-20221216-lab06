//
//  Somoim.swift
//  Semosomo
//
//  Created by Donghoon Bae on 2022/12/13.
//

import Foundation
import Firebase

//struct PhotoPost {
//    var id: String
//    var userID: String
//    var title: String
//    var content: String
//    var createdDate: Timestamp
//    var photos: [String]
//}

struct PhotoPost {
    var id: String
    var userID: String
    var title: String
    var content: String
    var createdDate: Timestamp
    var photos: [String]
    
    var currentUser: String
    var postImageUrl : String
}


struct PhotoComments {
    var id: String
    var userID: String
    var photoCommentContent: String
    var photoCommentCreatedDate: Timestamp
}

struct PhotoLikes {
    var id: String
    var userID: String
}
