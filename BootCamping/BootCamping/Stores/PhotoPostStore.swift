//
//  PhotoPosttore.swift
//  PhotoPost
//
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class PhotoPostStore: ObservableObject {
    
    let database = Firestore.firestore()
    
    @Published var photoPost: [PhotoPost] = []
    
    init() {
        photoPost = []
    }
    
    func fetchPhotoPost() {
        database.collection("PhotoPost")
            .getDocuments { (snapshot, error) in
                self.photoPost.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        let docData = document.data()
                        let title: String = docData["title"] as? String ?? ""
                        let content: String = docData["content"] as? String ?? ""
//                        let createdDate: Timestamp = docData["createdDate"] as? Timestamp ?? Timestamp(date: Date())
                        let createdDate: Timestamp = docData["createdDate"] as? Timestamp ?? Timestamp(date: Date())
                        let photos: [String] = docData["photos"] as? [String] ?? []
                        
                        let photoPost: PhotoPost = PhotoPost(id: id, title: title, content: content, createdDate: createdDate, photos: photos)
                        
                        self.photoPost.append(photoPost)
                    }
                }
            }
    }

    
    func addPhotoPost(_ photoPost: PhotoPost) {
        database.collection("PhotoPost")
            .document(photoPost.id)
            .setData(["title": photoPost.title,
                      "content": photoPost.content,
                      "createdDate": photoPost.createdDate,
                      "photos": photoPost.photos,
                     ])
        fetchPhotoPost()
    }
    
    func removePhotoPost(_ photoPost : PhotoPost) {
        database.collection("PhotoPost")
            .document(photoPost.id).delete()
        fetchPhotoPost()
    }
}
