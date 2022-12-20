//
//  Comment.swift
//  Semosomo
//
//  Created by Donghoon Bae on 2022/12/14.
//

import Foundation
import Firebase

struct Comment: Identifiable {
    var id: String
    var userID: String
    var content: String
    var createdDate: Timestamp
}
