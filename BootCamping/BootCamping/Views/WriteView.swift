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

    @StateObject var photoPostStore: PhotoPostStore
    @State private var title: String = ""
    @State private var content: String = ""
    
    //storage, fireStore연동
    @State private var isPickerShowing = false
    //선택된 이미지를 바인딩으로 이미지 피커에 전달
    @State private var selectedImage: UIImage?
    @State var selectedImages: [UIImage?] = []
    @State var retrievedImages = [UIImage]() //검색된 이미지들 배열로
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
            TextField("Content", text: $content)
            
            VStack {

                Button {
                    //이미지 피커 보여주기
                    isPickerShowing = true
                } label: {
                    Text("Select a Photo")
                }
                
                //파이어스토어 업로드 버튼
                if selectedImage != nil {
                    
                }
                
                Divider()
                
                ScrollView(.horizontal) {
                    //검색된 이미지들 UI에 보여줌
                    HStack {
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image!)
                                .resizable()
                                .frame(width: 200, height: 200)
                        }
                    }
                }
            }
            .sheet(isPresented: $isPickerShowing) {
                //이미지 피커, UIImagePickerController, UIKit과 연동 필요
                ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                    .onDisappear {
                    selectedImages.append(selectedImage)
                }
            }
            .onAppear {
                photoPostStore.retrievePhotos()
            }
            .padding()
            
            
            Button {
                Task {
                    try await photoPostStore.addPhotoPost(PhotoPost(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), title: title, content: content, createdDate: Timestamp(),  photos: []), selectedImages: selectedImages)
                }
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
