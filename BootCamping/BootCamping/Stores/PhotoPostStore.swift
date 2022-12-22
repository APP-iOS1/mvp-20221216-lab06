//
//  PhotoPosttore.swift
//  PhotoPost
//
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SwiftUI

class PhotoPostStore: ObservableObject {
    
    let database = Firestore.firestore()
    
    @Published private var selectedImage: UIImage?
    @Published var retrievedImages = [UIImage]() //검색된 이미지들 배열로
    

    @Published var postImageUrls: UIImage?
    @Published var photoPost: [PhotoPost] = []
    
    @Published var userID: String = ""
    
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var photos: String = ""
    @Published var createdDate: Timestamp = Timestamp(date: Date())
    
    /*
     let postData = ["id": uid, "userID": photoPost.userID, "title": photoPost.title, "content": content, "createdDate": photoPost.createdDate, "photos": photoPost.photos, "currentUser": Auth.auth().currentUser?.uid, "postImageUrl": imageProfileUrl.absoluteString]
     
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
     */
    
    func fetchPhotoPost() {
        database.collection("PhotoPost")
            .order(by: "createdDate", descending: true)
            .getDocuments { (snapshot, error) in
                self.photoPost.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        let docData = document.data()
                        
                        let userID: String = docData["userID"] as? String ?? ""
                        let title: String = docData["title"] as? String ?? ""
                        let content: String = docData["content"] as? String ?? ""
                        let createdDate: Timestamp = docData["createdDate"] as? Timestamp ?? Timestamp(date: Date())
                        let photos: [String] = docData["photos"] as? [String] ?? []
                        
                        let currentUser: String = docData["currentUser"] as? String ?? ""
                        let postImageUrl: String = docData["postImageUrl"] as? String ?? ""
                        
                        let photoPost: PhotoPost = PhotoPost(id: id, userID: userID, title: title, content: content, createdDate: createdDate, photos: photos, currentUser: currentUser, postImageUrl: postImageUrl)
                        
                        self.photoPost.append(photoPost)
                    }
                }
            }
    }
    
//    //업로드
//    func storeImageToStorage() {
//        let uid = UUID().uuidString
//        let ref = Storage.storage().reference(withPath: uid)
//
//        guard let imageData = postImageUrls?.jpegData(compressionQuality: 0.5) else {
//            return
//        }
//
//        ref.putData(imageData) { metadata, error in
//            if let error = error {
//                print("\(error)")
//                return
//            }
//
//            ref.downloadURL() { url, error in
//                if let error = error {
//                    print(error)
//                    return
//                }
//                print(url?.absoluteString ?? "망함")
//
//                guard let url = url else { return }
//
//                self.postToStore(imageProfileUrl: url, uid: uid)
//            }
//        }
//    }
//
//    func postToStore(imageProfileUrl: URL, uid: String) {
//
//        let uid = uid
//
//        let dateFormatter: DateFormatter = {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
//
//            return dateFormatter
//        }()
//
//
//        // model을 쓰면 쉽게 구조화할 수 있음
//        let postData = ["id": uid, "postImageUrl" : imageProfileUrl.absoluteString, "bodyText" : bodyTexts, "currentUser" : Auth.auth().currentUser?.uid, "date" : dateFormatter.string(from: Date.now)]
//
//        Firestore.firestore().collection("post").document(uid).setData(postData as [String : Any]) { error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            print("success")
//        }
//
//        fetchPost()
//    }
    
    //사진 스토리지
    func uploadPhoto() {
            let uid = UUID().uuidString
            let ref = Storage.storage().reference(withPath: uid)
            
            guard let imageData = postImageUrls?.jpegData(compressionQuality: 0.5) else {
                return
            }
            
            ref.putData(imageData) { metadata, error in
                if let error = error {
                    print("\(error)")
                    return
                }
                
                ref.downloadURL() { url, error in
                    if let error = error {
                        print(error)
                        return
                    }
                    print(url?.absoluteString ?? "망함")
                    
                    guard let url = url else { return }
                    //스토어에 올림
                    self.addPhotoPost(imageProfileUrl: url, uid: uid)
                }
            }
        }
    
    func addPhotoPost(imageProfileUrl: URL, uid: String) {
        let uid = uid

        let postData = ["id": uid, "userID": userID, "title": title, "content": content, "createdDate": createdDate, "photos": photos, "currentUser": Auth.auth().currentUser?.uid, "postImageUrl": imageProfileUrl.absoluteString] as [String : Any]
                            
        Firestore.firestore().collection("photoPost").document(uid).setData(postData as [String : Any]) { error in
            if let error = error {
                print(error)
                return
            }
            
            print("success")
        }
            fetchPhotoPost()
    }
    
    func postUpdate(photoPost: PhotoPost, content: String) {
        var selectedPost = photoPost
        
        selectedPost.content = content
        
        let postData = ["id": selectedPost.id, "userID": selectedPost.userID, "title": selectedPost.title, "content": content, "createdDate": selectedPost.createdDate, "photos": selectedPost.photos, "currentUser": Auth.auth().currentUser?.uid, "postImageUrl": selectedPost.postImageUrl] as [String : Any]
        
        Firestore.firestore().collection("photoPost").document(selectedPost.id).setData(postData as [String : Any]) { error in
            if let error = error {
                print(error)
                return
            }
            self.fetchPhotoPost()
        }
    }

    
//    func retrievePhotos() {
//        //데이터베이스에서 데이터 가져옴
//        let db = Firestore.firestore()
//        
//        db.collection("images").getDocuments { snapshot, error in
//            
//            if error == nil && snapshot != nil {
//                
//                var paths = [String]()
//                
//                //반환된 모든 문서
//                for doc in snapshot!.documents { //snapshot nil아니므로 강제언래핑 해도 괜찮음
//                    //파일 경로 추출하고 paths 배열에 경로 추가
//                    paths.append(doc["url"] as! String)
//                }
//                //파일 경로 반복하고, 스토리지에서 데이터 가져옴
//                for path in paths {
//                    //스토리지에서 참조 얻기
//                    let storageRef = Storage.storage().reference()
//                    
//                    //경로지정
//                    let fileRef = storageRef.child(path)
//                    
//                    //데이터 검색 /데이터 최대 크기 지정,(5메가)
//                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
//                        //에러 체크
//                        if error == nil && data != nil {
//                            //UIImage생성해서 배열에 넣음
//                            if let image = UIImage(data: data!) {
//                                
//                                DispatchQueue.main.async {
////                                    retrievedImages.append(image)
//                                }
//                            }
//                        }
//                    }
//                }
//                
//            }
//        }
//    }
    
    func removePhotoPost(_ photoPostID : String) {
        database.collection("PhotoPost")
            .document(photoPostID).delete()
        fetchPhotoPost()
    }
}
