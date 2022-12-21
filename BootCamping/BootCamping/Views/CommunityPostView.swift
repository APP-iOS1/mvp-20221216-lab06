//
//  CommunityPostView.swift
//  BootCamping
//
//  Created by 김혜지 on 2022/12/21.
//

import SwiftUI

struct CommunityPostView: View {
    var body: some View {
        VStack{
            
            VStack(alignment:.leading){

                HStack{
                    Text("캠핑 꿀팁")
                        .font(.footnote)
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
                
                VStack{
                    Text("강아지 산책은 역시 남의 강아지가 최고!!가나아ㅏ아아아아으ㅏ으ㅏ으ㅏ으ㅏ으ㅏ으아ㅡ아ㅡ아ㅡ아으ㅏ으ㅏ으ㅏ으ㅏ으ㅏ으ㅏ으ㅏ으아ㅡ아ㅡ아아아아아ㅏ가악아ㅏ아가ㅏ아가악 나는 혜지다!!!!!!!덤버려!! ")
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .font(.subheadline)
                    // 2 라인까지 줄바꿈 가능 옵션
                       .lineLimit(2)
                       // 여러줄일 경우 정렬을 왼쪽정렬로 선택
                       .multilineTextAlignment(.leading)
                       // 여러줄로 보여줄 수 있고, 옆으로 쭉 길게 보여주는건 비활성화 처리함
                       .fixedSize(horizontal: false, vertical: true)
                    
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .foregroundColor(Color("lightGray"))
                        .frame(height:140)
                        
                } //게시글 내용
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        Image("thekoon_")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .cornerRadius(50)
                        Text("thekoon_")
                            .foregroundColor(.black)
                            .font(.footnote)
                                }
                    
                    Button {
                        
                    } label: {
                        Text("팔로우")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }

                    

                } //유저 정보
               
            }.padding(.horizontal,20) //게시글
            
            Divider()

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
                        Text("좋아요")
                    }
                    Text("12")
                } // 좋아요, 댓글 버튼
                .font(.caption).foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal,20)
                .padding(.vertical,5)

            Rectangle()
                .frame(height: 5.0, alignment: .bottom)
                .foregroundColor(Color("lightGray"))
                

        } //커뮤니티 게시글 전체
    }
}

struct CommunityPostView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityPostView()
    }
}
