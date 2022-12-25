//
//  AddCommunityView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/21.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct AddCommunityView: View {
    @EnvironmentObject var authStore: AuthStore
    @StateObject var communityPostStore: CommunityPostStore
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var location: String = ""
    @State private var content: String = ""
    @State private var isPickerShowing = false
    @State private var selectedImage: UIImage?
    @State var selectedImages: [UIImage?] = []
    @State private var isDoneRegister: Bool = false
    @Binding var tabSelection: Int
    
    var user: Users {
        get {
            if Auth.auth().currentUser?.uid != nil {
                return authStore.userList.filter { $0.userID == String(Auth.auth().currentUser!.uid) }.first!
            } else {
                return Users(id: "", userID: "", userNickName: "", userEmail: "", profileImage: "")
            }
        }
    }
    
    var body: some View {
        if isDoneRegister{
            ProgressView()
        } else {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            if selectedImages.count > 10 {
                                isPickerShowing = false
                            } else {
                                isPickerShowing = true
                            }
                        } label: {
                            VStack {
                                Image(systemName: "photo").font(.title)
                                Text("\(selectedImages.count) / 10").font(.subheadline)
                            }
                            .frame(width: 100, height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.gray, lineWidth: 1)
                            )
                            .foregroundColor(.gray)
                            
                        }
                        
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(15)
                        }
                    }
                }
                
                
                VStack(alignment: .leading) {
                    Text("캠핑생활 카테고리").bold()
                    ZStack(alignment: .leading) {
                        TextField("카테고리를 선택해주세요 ex) 캠핑 꿀팁, 질문, 분실물", text: $category)
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                    Text("캠핑 이야기를 공유해주세요").bold()
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $content)
                            .scrollContentBackground(.hidden)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    )
                }
                .font(.subheadline)
                .sheet(isPresented: $isPickerShowing) {
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                        .onDisappear {
                            if selectedImage != nil {
                                selectedImages.append(selectedImage)
                            }
                        }
                }
                
                Button {
                    Task {
                        try await communityPostStore.addCommunityPost(communityPost: CommunityPost(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), userNickName: user.userNickName, title: title, content: content, createdDate: Timestamp(), photos: [], category: category.components(separatedBy: ", ")), selectedImages: selectedImages)
                        content = ""
                        category = ""
                        selectedImages = []
                        isDoneRegister = true
                        try await Task.sleep(nanoseconds: 2_000_000_000)
                        tabSelection = 4
                        isDoneRegister = false
                        
                    }
                } label: {
                    AddButton
                }
                
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("캠핑생활 글쓰기")
                        .modifier(TitleViewModifier())
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    private var AddButton: some View {
        loginButtonFrame(title: "등록 하기")
        
    }
    
}

struct AddCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommunityView(communityPostStore: CommunityPostStore(), tabSelection: .constant(3))
            .environmentObject(AuthStore())
    }
}
