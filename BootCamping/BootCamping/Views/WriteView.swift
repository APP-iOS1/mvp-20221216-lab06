//
//  WriteView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/19.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct WriteView: View {
    
    /*
     var id: String
     var title: String
     var content: String
     var createdDate: Timestamp
     var photos: [String]
     */
    @StateObject var photoPostStore: PhotoPostStore
    @State private var title: String = ""
    @State private var content: String = ""
    
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
            TextField("Content", text: $content)
            
            Button {
                photoPostStore.addPhotoPost(PhotoPost(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), title: title, content: content, createdDate: Timestamp(),  photos: []))
            } label: {
                Text("add")
            }
        }
        
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(photoPostStore: PhotoPostStore())
    }
}
