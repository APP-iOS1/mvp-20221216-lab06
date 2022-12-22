//
//  AuthStore.swift
//  Semosomo
//
//  Created by 차소민 on 2022/12/14.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SwiftUI

class AuthStore: ObservableObject {
    @Published var userNickName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var profileImage: UIImage?
    @Published var currentUser: Firebase.User?
    
    @Published var userList: [Users] = []
    
    let database = Firestore.firestore()
    
    init() {
        currentUser = Auth.auth().currentUser
        userList = []
    }
    
    
    func fetchUserList() {
        database.collection("UserList")
            .getDocuments { (snapshot, error) in
                self.userList.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        let docData = document.data()
                        let userNickName: String = docData["userNickName"] as? String ?? ""
                        let email: String = docData["email"] as? String ?? ""
                        let profileImage: String = docData["profileImage"] as? String ?? ""
                        
                        let nowUser: Users = Users(id: id, userNickName: userNickName, userEmail: email, profileImage: profileImage)
                        
                        self.userList.append(nowUser)
                    }
                }
            }
    }
    
    func addUserList(_ nowUser: Users, profileImage: UIImage?) async throws {
            let uploadedPhotos = try await uploadPhoto(selectedImage: profileImage)
            try await database.collection("UserList")
                .document(nowUser.id)
                .setData(["userNickName": nowUser.userNickName,
                          "email": nowUser.profileImage,
                          "profileImage": uploadedPhotos,
                         ])
            fetchUserList()
    }
    
    func uploadPhoto(selectedImage: UIImage?) async -> String {
        //이미지 프로퍼티가 nil인지 확인
        
        guard selectedImage != nil else {
            return ""
        }
        
        //storage ref 만듬
        let storageRef = Storage.storage().reference()
        //이미지를 데이터로 전활할 수 있는지 확인
        let imageData = selectedImage!.jpegData(compressionQuality: 0.5) //압축품질 0.8로
        
        //이미지를 데이터로 전환할수 있는지 확인, 확인했으므로 밑에 putData는 !로 간편하게 언래핑
        guard imageData != nil else {
            return ""
        }
        
        //파일 경로, 이름 지정, image 폴더에 접근
        let uuid = UUID().uuidString
        let path = "profileImage/\(uuid).jpg"
        
        let fileRef = storageRef.child(path)
        
        //데이터 업로드
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            
        }
        return "https://firebasestorage.googleapis.com/v0/b/todokoonsapp.appspot.com/o/profileImage%2F\(uuid).jpg?alt=media"
        
    }
    
    
    // 체크용 - 이메일 형식 맞는지 Mr. 정
    func checkAuthFormat() -> Bool {
        let emailRegex = "^([a-zA-Z0-9._-])+@[a-zA-Z0-9.-]+.[a-zA-Z]{3,20}$"
        return email.range(of: emailRegex, options: .regularExpression) != nil
        
    }
    
    // 확인하다 - 비밀번호 형식 맞는지, 두 개 동일한지
    func checkPasswordFormat() -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&()_+=-]).{8,50}$"
        return password.range(of: passwordRegex, options: .regularExpression) != nil
        
        if password != confirmPassword {
            return false
        } else {
            return password.range(of: passwordRegex, options: .regularExpression) != nil
        }
        
    }
    
    
    //로그인
    func signIn() async throws {
        
        try await Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                return
            }
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self.currentUser = result?.user
        }
    }
    
    
    //로그아웃
    func signOut() {
        self.currentUser = nil
        try? Auth.auth().signOut()
    }
    
    
    //회원가입
    func signUp() async -> Bool {
        if checkPasswordFormat() && checkAuthFormat(){
            
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                return true
            }
            catch {
                print(error)
                return false
                
            }
            
        } else {
            print("password: \(password), confirmPassword: \(confirmPassword), email: \(email)")
            return false
        }
        
    }
    
    
}
