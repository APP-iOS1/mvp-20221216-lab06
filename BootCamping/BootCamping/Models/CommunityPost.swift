//
//  Community.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/23.
//

import Foundation
import Firebase

struct CommunityPost {
    var id: String
    var userID: String
    var userNickName: String
    var title: String
    var content: String
    var createdDate: Timestamp
    var photos: [String]
    var category: [String]
    
}


struct CommunityComments {
    var id: String
    var userID: String
    var communityCommentContent: String
    var communityCommentCreatedDate: Timestamp
}

struct CommunityLikes {
    var id: String
    var userID: String
}
