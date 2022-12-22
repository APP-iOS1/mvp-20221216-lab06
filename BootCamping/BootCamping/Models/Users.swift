//
//  User.swift
//  Semosomo
//
//  Created by Donghoon Bae on 2022/12/13.
//

import Foundation

struct Users {
    var id: String
    var userNickName: String
    var userEmail: String
    var profileImage: String
}

struct Follower {
    var id: String
    var userEmail: String
}

struct Following {
    var id: String
    var userEmail: String
}
