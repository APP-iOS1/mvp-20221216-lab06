//
//  Addview.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct AddView: View {
    @StateObject var photoPostStore: PhotoPostStore
    @State private var title: String = ""
    @State private var hashTag: String = ""
    @State private var location: String = ""
    @State private var content: String = ""
    @Binding var tabSelection: Int
    @State private var isDoneRegister: Bool = false
    
    //storage, fireStore연동
    @State private var isPickerShowing = false
    //선택된 이미지를 바인딩으로 이미지 피커에 전달
    @State private var selectedImage: UIImage?
    @State var selectedImages: [UIImage?] = []
    
    var body: some View {
        if isDoneRegister{
            ProgressView()
        } else {
            
            VStack {
                ScrollView(.horizontal) {
                    //검색된 이미지들 UI에 보여줌
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
                                Text("\(selectedImages.count) / 10").font(.subheadline).padding(.top,8)
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
                    .padding(.bottom,10)
                }
                
                
                VStack(alignment: .leading) {
                    Text("캠핑 피드 제목 ").font(.title3).fontWeight(.semibold)
                    ZStack(alignment: .leading) {
                        TextField("제목을 입력해주세요", text: $hashTag)
                            .frame(height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("lightGray")))
                    }
                    Text("").bold()
                    ZStack(alignment: .leading) {
                        TextField("위치 등록 하기 (선택)", text: $location)
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("lightGray")))
                    }
                    
                    Text("캠핑 이야기를 공유해주세요").padding(.top,10).font(.title3).fontWeight(.semibold)
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $content)
                            .scrollContentBackground(.hidden)
                    }.overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("lightGray"))
                    
                    
                    )
                }
                .font(.subheadline)
                .sheet(isPresented: $isPickerShowing) {
                    //이미지 피커, UIImagePickerController, UIKit과 연동 필요
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                        .onDisappear {
                            if selectedImage != nil {
                                selectedImages.append(selectedImage)
                            }
                        }
                }
                
                // TODO: asyncimage refactor
                Button {
                    Task {
                        try await photoPostStore.addPhotoPost(PhotoPost(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), title: title, content: content, createdDate: Timestamp(),  photos: []), selectedImages: selectedImages)
                        selectedImages = []
                        content = ""
                        photoPostStore.fetchPhotoPost()
                        photoPostStore.retrievePhotos()
                        isDoneRegister = true
                        try await Task.sleep(nanoseconds: 2_000_000_000)
                        tabSelection = 5
                        isDoneRegister = false
                    }
                } label: {
                    AddButton
                }
                .onAppear {
                    print(AuthStore().userList)
                }
                
                .navigationTitle("마이캠핑 글쓰기")
                .navigationBarTitleDisplayMode(.inline)
            }.padding()

        }
    }
    
    private var AddButton: some View {
        loginButtonFrame(title: "등록 하기")
            
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView(photoPostStore: PhotoPostStore(), tabSelection: .constant(1))
        }
    }
}
