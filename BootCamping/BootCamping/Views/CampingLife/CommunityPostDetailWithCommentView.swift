//
//  CommunityPostDetailWithCommentView.swift
//  BootCamping
//
//  Created by 김혜지 on 2022/12/23.
//

import SwiftUI
import Foundation
import Firebase

struct CommunityPostDetailWithCommentView: View {

    @State var commentText: String = ""
    
    @StateObject var communutyPostStore: CommunityPostStore = CommunityPostStore()
    @StateObject var communityCommentStore: CommunityCommentStore = CommunityCommentStore()
    
    @EnvironmentObject var authStore: AuthStore
    
    var communityPost: CommunityPost
    
    var user: Users {
        authStore.userList.filter { $0.userID == communityPost.userID }.first!
    }
     
    var body: some View {
        
        VStack{
            
            ScrollView(){
                
                VStack{
                    
                    VStack(alignment:.leading){

                        HStack{
                            Text("캠핑 꿀팁")
                                .font(.subheadline)
                                .padding(.vertical,5)
                                .padding(.horizontal,10)
                                .background(Color("lightGray"))
                                .foregroundColor(.gray)
                            
                            Text("캠핑 꿀팁")
                                .font(.footnote)
                                .padding(.vertical,5)
                                .padding(.horizontal,10)
                                .background(Color("lightGray"))
                                .foregroundColor(.gray)
                        } //게시글 글 종류 해시태그
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.vertical,15)
                        
                        HStack{
                            
                            HStack{
                                
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
                                    
                                    Text(communityPost.userNickName)
                                        .foregroundColor(.black)
                                        .font(.callout)
                                            }
                                
                                Button {
                                    
                                } label: {
                                    Text("팔로우")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                }

                            } //유저 정보
                            
                            Spacer()
                            
                            Text("\(TimestampToString.dateString(communityPost.createdDate)) 전")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }// 유저 정보 + 시간 정보
                        
                        
                        VStack(alignment: .leading) {
                            Text("\(communityPost.content)")
                                .foregroundColor(.black)
                                .padding(.vertical,10)
                                .font(.body)
                            
                               // 여러줄일 경우 정렬을 왼쪽정렬로 선택
                               .multilineTextAlignment(.leading)
                               // 여러줄로 보여줄 수 있고, 옆으로 쭉 길게 보여주는건 비활성화 처리함
                               .fixedSize(horizontal: false, vertical: true)
                            
                            ForEach(communityPost.photos, id: \.self) { photo in
                                AsyncImage(url: URL(string: photo)) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                                .frame(height:200)
                            }
                            
                            
                        } //게시글 내용
        
                    } //게시글
                    .padding(.horizontal,20)
                    .padding(.bottom,15)
                    
                    Divider()
                    
                    VStack{
                        
                        VStack{
                            
                            HStack{
                                Button {
                                    //좋아요버튼
                                } label: {
                                    Image(systemName:"heart")
                                    Text("좋아요")
                                    
                                }
                                Text("12")
                                Button {
                                    //댓글
                                } label: {
                                    Image(systemName:"bubble.right")
                                    Text("댓글")
                                }
                                Text("12")
                            } // 좋아요, 댓글 버튼
                            .font(.subheadline).foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                            .padding(.vertical,5)
                            
                            HStack{
                                
                                Text("13개의 댓글")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                HStack{
                                    
                                    Button {
                                        //등록순
                                    } label: {
                                        Text("등록순")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                    
                                    Button {
                                        //추천순
                                    } label: {
                                        Text("추천순")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                    }
                                }
                            }
                            .padding(.vertical,15)
                            //n개의 댓글, 등록순, 추천순 영역
                            
                        } //댓글 칸
                        
//                        VStack(alignment: .leading){
//
//                            HStack{
//
//                                Image("thekoon_")
//                                    .resizable()
//                                    .frame(width: 30,height: 30)
//                                    .cornerRadius(50)
//                                Text("hyehyehye99")
//                                    .foregroundColor(.black)
//                                    .font(.callout)
//                                    .fontWeight(.semibold)
//
//                                Spacer()
//
//                                Text("2022-12-23")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//
//                            } //댓글 프로필
//
//                            VStack(alignment:.leading){
//
//                                Text("헐 진짜 재밌겠당!!! ")
//                                    .padding(.bottom,3)//댓글 내용
//
//                                HStack{
//
//                                    Text("10분전") //몇분전
//
//                                    HStack{
//
//                                        Button {
//                                            //댓글 좋아요
//                                        } label: {
//                                            Text("좋아요")
//                                        }
//
//                                        Text("1")
//
//                                    } //댓글 좋아요 버튼
//
//                                    Button {
//                                        //답글달기
//                                    } label: {
//                                        Text("답글달기")
//                                    }
//                                }
//                                .foregroundColor(.gray)
//                                .font(.callout)
//
//                            } //댓글 내용 ,정보
//                            .padding(.horizontal,30)
//                        } //댓글
                        .padding(.bottom,15)

                    }.padding(.horizontal,20)
                    

                } //커뮤니티 게시글 전체
                
                
            }
            
            HStack{
                
                HStack{
                    
                    Image(systemName:"face.smiling")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    TextField("댓글을 입력해주세요", text: $commentText)
                        .textFieldStyle(OvalTextFieldStyle())
                    
                    Button {
                        //댓글 등록하기 버튼
                        let communityComment: CommunityComments = CommunityComments(id: UUID().uuidString, userID: user.userID, communityCommentContent: commentText, communityCommentCreatedDate: Timestamp())

                        communityCommentStore.addCommunityComment(communityComment)

                        commentText = ""
                        
                    } label: {
                        Image(systemName: "arrow.forward.circle.fill")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.horizontal,20)
                .padding(.top,10)
                .onAppear{
                    communityCommentStore.postId = communityPost.id
                    communityCommentStore.fetchCommunityComment()
                    AuthStore().fetchUserList()
                }

            } //댓글 창
            .background(Color.white)
            .frame(alignment: .bottom)
    
        }
        
       
    }
}

struct CommunityPostDetailWithCommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPostDetailWithCommentView(communityPost: CommunityPostStore().communityPost.first!)
    }
}
