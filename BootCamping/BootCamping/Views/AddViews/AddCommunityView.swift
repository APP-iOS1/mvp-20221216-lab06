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
//    @StateObject var photoPostStore: PhotoPostStore
//    @State private var title: String = ""
//    @State private var hashTag: String = ""
//    @State private var location: String = ""
//    @State private var content: String = ""
//
//    //storage, fireStore연동
//    @State private var isPickerShowing = false
//    //선택된 이미지를 바인딩으로 이미지 피커에 전달
//    @State private var selectedImage: UIImage?
//    @State var selectedImages: [UIImage?] = []
//
//    var body: some View {
//        @StateObject var photoPostStore: PhotoPostStore
//        @State private var title: String = ""
//        @State private var hashTag: String = ""
//        @State private var location: String = ""
//        @State private var content: String = ""
//
//        //storage, fireStore연동
//        @State private var isPickerShowing = false
//        //선택된 이미지를 바인딩으로 이미지 피커에 전달
//        @State private var selectedImage: UIImage?
//        @State var selectedImages: [UIImage?] = []
        
        var body: some View {
            Text("")
//            VStack {
//    //            HStack {
//    //                Button {
//    //
//    //                } label: {
//    //                    Text("X").font(.title3).bold().foregroundColor(.black)
//    //                }
//    //                Spacer()
//    //                Text("글쓰기").font(.title3).bold()
//    //                Spacer()
//    //                Button {
//    //
//    //                } label: {
//    //                    Text("미리보기")
//    //                        .foregroundColor(.black)
//    //                }
//    //            }
//    //            Divider()
//                ScrollView(.horizontal) {
//                    //검색된 이미지들 UI에 보여줌
//                    HStack {
//                        Button {
//                            if selectedImages.count > 10 {
//                                isPickerShowing = false
//                            } else {
//                                isPickerShowing = true
//                            }
//                        } label: {
//                            VStack {
//                                Image(systemName: "photo").font(.title)
//                                Text("\(selectedImages.count) / 10").font(.subheadline)
//                            }
//                                .frame(width: 100, height: 100)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(.gray, lineWidth: 1)
//                                )
//                                .foregroundColor(.gray)
//
//                        }
//
//                        ForEach(selectedImages, id: \.self) { image in
//                            Image(uiImage: image!)
//                                .resizable()
//                                .frame(width: 100, height: 100)
//                                .cornerRadius(15)
//                        }
//                    }
//                }
//
//
//                VStack(alignment: .leading) {
//                    Text("부트캠핑 해시태그").bold()
//                    ZStack(alignment: .leading) {
//                        TextField("", text: $hashTag)
//                            .frame(height: 40)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(.gray, lineWidth: 1)
//                            )
//                        if hashTag.isEmpty {
//                            Text("캠핑의 해시태그를 적어주세요! (최대 3개)")
//                                .padding(.horizontal)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    Text("").bold()
//                    ZStack(alignment: .leading) {
//                        TextField("", text: $location)
//                            .frame(height: 40)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(.gray, lineWidth: 1)
//                            )
//                        if location.isEmpty {
//                            Text("위치 등록 하기 (선택)")
//                                .padding(.horizontal)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    Text("캠핑 이야기를 공유해주세요").bold()
//                    ZStack(alignment: .topLeading) {
//                        TextEditor(text: $content)
//                            .scrollContentBackground(.hidden)
//                        if content.isEmpty {
//                            VStack(alignment: .leading) {
//                                Text("\n소제목을 적어주세요")
//                                Divider()
//                                Text("어떤 캠핑을 다녀오셨나요? 경험을 공유해주세요").padding(.top)
//                            }
//                            .foregroundColor(.gray)
//                            .padding(.top)
//                            .padding(.horizontal)
//
//                        }
//                    }
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(.gray, lineWidth: 1)
//                    )
//                }
//                .font(.subheadline)
//                .sheet(isPresented: $isPickerShowing) {
//                    //이미지 피커, UIImagePickerController, UIKit과 연동 필요
//                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
//                        .onDisappear {
//                            if selectedImage != nil {
//                                selectedImages.append(selectedImage)
//                            }
//                    }
//                }
//
//                Button {
//                    Task {
//                        try await photoPostStore.addPhotoPost(PhotoPost(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.uid ?? ""), title: title, content: content, createdDate: Timestamp(),  photos: []), selectedImages: selectedImages)
//                    }
//                } label: {
//                    AddButton
//                }
//
//
//            }.padding()
//                .navigationTitle("글쓰기")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button {
//
//                        } label: {
//                            Text("X").foregroundColor(.black)
//                        }
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//
//                        } label: {
//                            Text("미리보기").foregroundColor(.black)
//                        }
//                    }
//                }
//        }
//
//        private var AddButton: some View {
//            loginButtonFrame(title: "등록 하기")
//        }
//
//    }
//
//    private var AddButton: some View {
//        loginButtonFrame(title: "등록 하기")
                .navigationTitle("캠핑생활 글쓰기")
                .navigationBarTitleDisplayMode(.inline)
        }
    
}

struct AddCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommunityView()
    }
}
