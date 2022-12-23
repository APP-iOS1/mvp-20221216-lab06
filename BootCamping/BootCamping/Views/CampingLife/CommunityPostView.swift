//
//  CommunityPostView.swift
//  BootCamping
//
//  Created by 김혜지 on 2022/12/21.
//

import SwiftUI
import Firebase

struct CommunityPostView: View {
    @State var commentText:String=""
    
    var body: some View {
        
        VStack{
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
                                    Image("thekoon_")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                        .cornerRadius(50)
                                    Text("thekoon_")
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
                            
                            Text("2022-12-23 13:25")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }// 유저 정보 + 시간 정보
                        
                        
                        VStack{
                            Text(" 강아지 산책은 역시 남의 강아지가 최고! 요즘 반려동물 동반이 가능한 캠핑장이 많더라구요! 남의 강아지도 구경하면서 캠핑 즐기면 참 재미있더라구요^^* ")
                                .lineLimit(2)
                                .foregroundColor(.black)
                                .padding(.vertical,10)
                                .font(.body)
                                
                            
                               // 여러줄일 경우 정렬을 왼쪽정렬로 선택
                               .multilineTextAlignment(.leading)
                               // 여러줄로 보여줄 수 있고, 옆으로 쭉 길게 보여주는건 비활성화 처리함
                               .fixedSize(horizontal: false, vertical: true)
                            
                            Rectangle() //사진 들어갈 자리
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                                .foregroundColor(Color("lightGray"))
                                .frame(height:200)
                                
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
        CommunityPostView()
    }
}
