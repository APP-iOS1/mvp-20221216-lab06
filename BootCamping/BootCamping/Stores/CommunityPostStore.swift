//
//  CommunityPostStore.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SwiftUI

class CommunityPostStore: ObservableObject {
    
    let database = Firestore.firestore()
    
    @Published private var selectedImage: UIImage?
    @Published var retrievedImages = [UIImage]() //검색된 이미지들 배열로
    @Published var communityPost: [CommunityPost] = []
    
    init() {
        communityPost = []
    }
    
    func fetchCommunityPost() {
        database.collection("CommunityPost")
            .order(by: "createdDate", descending: true)
            .getDocuments { (snapshot, error) in
                self.communityPost.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        let docData = document.data()
                        let userID: String = docData["userID"] as? String ?? ""
                        let title: String = docData["title"] as? String ?? ""
                        let userNickName: String = docData["userNickName"] as? String ?? ""
                        let content: String = docData["content"] as? String ?? ""
                        //                        let createdDate: Timestamp = docData["createdDate"] as? Timestamp ?? Timestamp(date: Date())
                        let createdDate: Timestamp = docData["createdDate"] as? Timestamp ?? Timestamp(date: Date())
                        let photos: [String] = docData["photos"] as? [String] ?? []
                        let category: [String] = docData["category"] as? [String] ?? []
                        
                        let communityPost: CommunityPost = CommunityPost(id: id, userID: userID, userNickName: userNickName, title: title, content: content, createdDate: createdDate, photos: photos, category: category)
                        
                        self.communityPost.append(communityPost)
                    }
                }
            }
    }
    
    /*var id: String
     var userID: String
     var userNickName: String
     var title: String
     var content: String
     var createdDate: Timestamp
     var photos: [String]
     var category: [String]*/
    
    func addCommunityPost(communityPost: CommunityPost, selectedImages: [UIImage?]) async throws {
        do {
            let uploadedCommunitys = try await uploadCommunity(selectedImages: selectedImages)
            try await database.collection("CommunityPost")
                .document(communityPost.id)
                .setData(["userID": communityPost.userID,
                          "userNickName": communityPost.userNickName,
                          "title": communityPost.title,
                          "content": communityPost.content,
                          "createdDate": communityPost.createdDate,
                          "photos": uploadedCommunitys,
                          "category": communityPost.category
                         ])
            fetchCommunityPost()
        } catch {
            print(error)
        }
    }
    
    //사진 스토리지
    func uploadCommunity(selectedImages: [UIImage?]) async -> [String] {
        //이미지 프로퍼티가 nil인지 확인
        var communitys: [String] = []
        
        for selectedImage in selectedImages {
            guard selectedImage != nil else {
                return []
            }
            
            //storage ref 만듬
            let storageRef = Storage.storage().reference()
            //이미지를 데이터로 전활할 수 있는지 확인
            let imageData = selectedImage!.jpegData(compressionQuality: 0.5) //압축품질 0.8로
            
            //이미지를 데이터로 전환할수 있는지 확인, 확인했으므로 밑에 putData는 !로 간편하게 언래핑
            guard imageData != nil else {
                return []
            }
            
            //파일 경로, 이름 지정, image 폴더에 접근
            let uuid = UUID().uuidString
            let path = "image/\(uuid).jpg"
            
            let fileRef = storageRef.child(path)
            communitys.append("https://firebasestorage.googleapis.com/v0/b/todokoonsapp.appspot.com/o/image%2F\(uuid).jpg?alt=media")
            
            //데이터 업로드
            let uploadTask = fileRef.putData(imageData!, metadata: nil)
        }
        return communitys
        
    }
    
    func retrieveCommunitys() {
        //데이터베이스에서 데이터 가져옴
        let db = Firestore.firestore()
        
        db.collection("images").getDocuments { snapshot, error in
            
            if error == nil && snapshot != nil {
                
                var paths = [String]()
                
                //반환된 모든 문서
                for doc in snapshot!.documents { //snapshot nil아니므로 강제언래핑 해도 괜찮음
                    //파일 경로 추출하고 paths 배열에 경로 추가
                    paths.append(doc["url"] as! String)
                }
                //파일 경로 반복하고, 스토리지에서 데이터 가져옴
                for path in paths {
                    //스토리지에서 참조 얻기
                    let storageRef = Storage.storage().reference()
                    
                    //경로지정
                    let fileRef = storageRef.child(path)
                    
                    //데이터 검색 /데이터 최대 크기 지정,(5메가)
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        //에러 체크
                        if error == nil && data != nil {
                            //UIImage생성해서 배열에 넣음
                            if let image = UIImage(data: data!) {
                                
                                DispatchQueue.main.async {
//                                    retrievedImages.append(image)
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    func removeCommunityPost(_ communityPostID : String) {
        database.collection("CommunityPost")
            .document(communityPostID).delete()
        fetchCommunityPost()
    }
}
