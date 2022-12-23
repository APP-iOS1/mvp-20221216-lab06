//
//  CommunityView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        
        NavigationStack{
            
            VStack{
                
                VStack{
                    
                    HStack(alignment: .center){
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("캠핑 생활")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NavigationLink(destination: SearchSomethingView() ) {
                                    Image(systemName: "magnifyingglass")
                                    .font(.title2)
                        }
                        
                    }
                    .padding(.top,20)
                    .padding(.horizontal,20)
                        
                    
                } //타이틀

                
                Rectangle()
                    .frame(height: 1.0, alignment: .bottom)
                    .foregroundColor(Color("lightGray")) //타이틀 구분선

                ScrollView(){
                    
                    VStack{

                        VStack{
                         ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    Button {
                                        //글 종류 선택 모달 나오게
                                    } label: {

                                        HStack{
                                            Image(systemName: "line.3.horizontal" )
                                                .padding(.trailing,-3)
                                            
                                            Text("글 종류")
                                                
                                        }
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                        .fontWeight(.medium)
                                        .padding(.vertical,8)
                                        .padding(.horizontal,9)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.gray, lineWidth: 1)
                                        )

                                    } //글 종류 버튼

                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("캠핑 꿀팁")
                                                        .foregroundColor(.gray)
                                                        .font(.headline)
                                                        .fontWeight(.medium)
                                                        .padding(.vertical,8)
                                                        .padding(.horizontal,9)
                                                        .overlay (
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.gray, lineWidth: 1)
                                                        )
                                                })//캠핑 꿀팁
                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("질문")
                                                        .foregroundColor(.gray)
                                                        .font(.headline)
                                                        .fontWeight(.medium)
                                                        .padding(.vertical,8)
                                                        .padding(.horizontal,9)
                                                        .overlay (
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.gray, lineWidth: 1)
                                                        )
                                                })//질문
                                    
                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("분실물")
                                                        .foregroundColor(.gray)
                                                        .font(.headline)
                                                        .fontWeight(.medium)
                                                        .padding(.vertical,8)
                                                        .padding(.horizontal,9)
                                                        .overlay (
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.gray, lineWidth: 1)
                                                        )
                                                })//분실물
                                    
                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("추천")
                                                        .foregroundColor(.gray)
                                                        .font(.headline)
                                                        .fontWeight(.medium)
                                                        .padding(.vertical,8)
                                                        .padding(.horizontal,9)
                                                        .overlay (
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.gray, lineWidth: 1)
                                                        )
                                                })//추천
                                    
                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("잡담")
                                                        .foregroundColor(.gray)
                                                        .font(.headline)
                                                        .fontWeight(.medium)
                                                        .padding(.vertical,8)
                                                        .padding(.horizontal,9)
                                                        .overlay (
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.gray, lineWidth: 1)
                                                        )
                                                })//잡담
                                }.padding(.vertical,5)
                            }
                         
                        }.padding(.leading,20) // 카테고리 선택
                        
                        Divider()
                        
                        VStack{
                            
                            NavigationLink(destination: CommunityPostDetailWithCommentView()) {
                                                    CommunityPostView()
                            }
                            
                            NavigationLink(destination: CommunityPostDetailWithCommentView()) {
                                                    CommunityPostView()
                                            }

                            
                        }

                        
                        
                        
                    }

                }
                
                
                
                
                
            }
            
        }
        
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
