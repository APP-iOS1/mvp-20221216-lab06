//
//  CommunityPostView.swift
//  BootCamping
//
//  Created by 김혜지 on 2022/12/21.
//

import SwiftUI
import Firebase

struct CommunityPostRow: View {
    @EnvironmentObject var authStore: AuthStore
    @State var commentText:String=""
    var communityPost: CommunityPost
    var user: Users {
        get {
            return authStore.userList.filter { $0.userID == communityPost.userID }.first!
        }
    }
    
    var body: some View {
        
        VStack{
                VStack{
                    
                    VStack(alignment:.leading){
                        
                        if communityPost.category.count != 0 {
                            if communityPost.category.first != "" {
                                ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                        ForEach(communityPost.category, id: \.self) { category in
                                            Text("\(category)")
                                                .font(.subheadline)
                                                .padding(.vertical,5)
                                                .padding(.horizontal,10)
                                                .background(Color("lightGray"))
                                                .foregroundColor(.gray)
                                        } //게시글 글 종류 해시태그
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                        .padding(.vertical,15)
                                    }
                                }
                            }
                        }
                        
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
                                    Text("\(communityPost.userNickName)")
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
                            
                            Text("\(TimestampToString.dateString(communityPost.createdDate))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }// 유저 정보 + 시간 정보
                        
                        
                        VStack(alignment: .leading) {
                            Text("\(communityPost.content)")
                                .lineLimit(2)
                                .foregroundColor(.black)
                                .padding(.vertical,10)
                                .font(.body)
                               // 여러줄일 경우 정렬을 왼쪽정렬로 선택
                               .multilineTextAlignment(.leading)
                               // 여러줄로 보여줄 수 있고, 옆으로 쭉 길게 보여주는건 비활성화 처리함
                               .fixedSize(horizontal: false, vertical: true)
                            
                            if communityPost.photos.count != 0 {
                                AsyncImage(url: URL(string: communityPost.photos.first ?? "")) { image in
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
       
                        } //댓글 칸
             
                    }.padding(.horizontal,20)
                } //커뮤니티 게시글 전체
        }
    }
}



struct CommunityPostView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPostRow(communityPost: CommunityPostStore().communityPost.first!)
    }
}
