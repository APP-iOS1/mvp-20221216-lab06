//
//  ArticleDetailView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/20.
//

import SwiftUI
import Foundation
import Firebase

// TODO: 사용자 이름 및 프로필사진 게시자로 변경
struct ArticleDetailView: View {
    
    @State private var isGood: Bool = false
    @State private var favoriteMark: Bool = false
    
    @State private var commentText: String = ""
    var photoPost: PhotoPost
    @StateObject var photoCommentStore: PhotoCommentStore
    @Environment(\.presentationMode) var postingRemove
    var user: Users

    var body: some View {
        // 해시태그, 타이틀, 작성날짜
        ScrollView {
            VStack(alignment: .leading) {
                Group {
//                    Text("#불멍 #추워 #더포레")
//                        .font(.title2)
//                        .fontWeight(.bold)
                    Text(photoPost.title) // 제목
                        .font(.system(.title3, weight: .semibold))
                        .kerning(-1)
                    Text("\(TimestampToString.dateString(photoPost.createdDate)) 전") // 작성시간
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 2)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (photoPost.photos, id: \.self) { photo in
                            AsyncImage(url: URL(string: photo)) { image in
                                image
                                    .resizable()
                                    .frame(width: 360, height: 360)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.vertical, 5)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
//                Image(photoPost.photos)
//                    .resizable()
//                    .frame(width: 360, height: 360)
//                    .aspectRatio(contentMode: .fit)
//                    .padding(.vertical, 5)
                
                // 본문내용, 위치, 예약버튼
                Group {
                    Text(photoPost.content)
                        .kerning(-0.5)
                        .lineSpacing(5)
                        .font(.callout)
                        .padding(.bottom,20)
                        .padding(.horizontal, 7)
                    
                    HStack {
                        Text("위치 | 카페 더 포레")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button {
                        } label: {
                            Text("예약하기 >")
                                .font(.footnote)
                                .padding(.leading, 10)
                        }
                        
                    }
                    
                    // 작성자 계정 & 팔로우
                    HStack {
                        Button {
                        } label: {
                            AsyncImage(url: URL(string: user.profileImage)) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 30,height: 30)
                            .cornerRadius(50)
                                
                            Text(user.userNickName)
                        }
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.brown)
                                    .frame(width: 80, height: 30)
                                Text("팔로우")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.vertical)
                }
                
                Divider()
                
                // 좋아요, 댓글, 북마크
                HStack {
                    Button {
                        isGood.toggle()
                    } label: {
                        Image(systemName: isGood ? "heart.fill" : "heart")
                        Text("3") // 좋아요 카운트
                    }
                    Image(systemName: "ellipsis.message")
                        .padding(.leading, 10)
                    Text("\(photoCommentStore.photocomments.count)") // 댓글 개수
                    
                    Spacer()
                    // 게시글 북마크
                    Button {
                        favoriteMark.toggle()
                    } label: {
                        Image(systemName: favoriteMark ? "bookmark.fill" : "bookmark")
                    }
                }
                .padding(8)
                
                Divider()
                
                Text("댓글")
                    .font(.headline)
                    .padding(10)
                
                // 댓글
                ForEach(photoCommentStore.photocomments, id: \.id){ comment in
                    Comments(photoComments: comment, user: user)
                }
            }
            .padding()
            
            // 댓글 더보기 버튼
            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.brown)
                        .frame(width: 80, height: 30)
                    Text("더보기..")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }
            
            HStack {
                AsyncImage(url: URL(string: user.profileImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }   .frame(width: 25,height: 25)
                    .cornerRadius(50)
                
                TextField("댓글을 남겨보세요!", text: $commentText)
                    .textFieldStyle(OvalTextFieldStyle())
                    .font(.subheadline)
                    .frame(width: 270, height: 40)

                Button {
                    let photoComment: PhotoComments = PhotoComments(id: UUID().uuidString, userID: String(Auth.auth().currentUser?.email ?? ""), photoCommentContent: commentText, photoCommentCreatedDate: Timestamp())
                    
                    photoCommentStore.addPhotoComment(photoComment)
                    
                    commentText = ""
                    
                } label: {
                    Image(systemName: "arrow.forward.circle.fill")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
        .onAppear{
            photoCommentStore.postId = photoPost.id
            photoCommentStore.fetchPhotoComment()
            AuthStore().fetchUserList()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    PhotoPostStore().removePhotoPost(photoPost.id)
                    postingRemove.wrappedValue.dismiss()
                } label: {
                    Text("삭제")
                }
            }
        }
    }
}

// 댓글

struct Comments: View {
    var photoComments: PhotoComments
    var user: Users

    
    var body: some View {
        // ScrollView(.vertical) {
        VStack(alignment: .leading) {
           
            HStack {
                AsyncImage(url: URL(string: user.profileImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 30,height: 30)
                .cornerRadius(50)
 
                Text(user.userNickName)
                    .font(.subheadline)
            }
            .padding(.bottom, -5)
            VStack(alignment: .leading) {
                Text(photoComments.photoCommentContent)
                    .font(.subheadline)
                    .kerning(-0.5)
                    .padding(.bottom, 1)
                
                Text("\(TimestampToString.dateString(photoComments.photoCommentCreatedDate)) 전")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(width: 80)
                
            }
            .padding(.leading, 40)
        }
        // .frame(width: 350, alignment: .leading)
        //                    .rotationEffect(Angle(degrees: 180))
        //  }
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color("lightGray"))
            .cornerRadius(20)

    }
}



struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(photoPost: PhotoPostStore().photoPost.first!, photoCommentStore: PhotoCommentStore(), user: AuthStore().userList.first!)
    }
}
