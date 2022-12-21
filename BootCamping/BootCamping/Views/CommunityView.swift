//
//  CommunityView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                VStack{
                    
                    HStack(alignment: .center){
                        Text("캠핑 생활")
                            .font(.title2)
                            .fontWeight(.bold)
                    }.padding(.top,20)
                    
                    
                    
                } //타이틀
      
                ScrollView(){
                    
                    VStack{
                        
                        VStack{
                            
                            SearchView()
                            
                            Rectangle()
                                .frame(height: 5.0, alignment: .bottom)
                                .foregroundColor(Color("lightGray"))
                                .padding(.top,15)
                            
                        } .padding(.top,20)//검색창

                        VStack{
                         ScrollView(.horizontal){
                                HStack{
                                    Button {
                                        //글 종류 선택 모달 나오게 (기획 중)
                                    } label: {
                                        HStack{
                                            Image(systemName: "line.3.horizontal" )
                                                .font(.footnote)
                                                .padding(.trailing,-3)
                                            Text("글 종류")
                                        }
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .padding(.vertical,5)
                                        .padding(.horizontal,8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.gray, lineWidth: 0.5)
                                            )
                                    } //글 종류 버튼
                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("캠핑 꿀팁")
                                                        .font(.footnote)
                                                        .foregroundColor(.gray)
                                                        .padding(.vertical,5)
                                                        .padding(.horizontal,8)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 30)
                                                                .stroke(Color.gray, lineWidth: 0.8))
                                                }) //캠핑 꿀팁
                                    NavigationLink(
                                                destination: CommunityCategoryView(),
                                                label: {
                                                    Text("질문")
                                                        .font(.footnote)
                                                        .foregroundColor(.gray)
                                                        .padding(.vertical,5)
                                                        .padding(.horizontal,8)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 30)
                                                                .stroke(Color.gray, lineWidth: 0.8))
                                                }) //질문
                                }
                            }
                        }.padding(.horizontal,20) // 카테고리 선택
                        
                        Divider()
                        
                        VStack{
                            
                            NavigationLink(destination: Text("기획전~")) {
                                                    CommunityPostView()
                                            }
                            
                            NavigationLink(destination: Text("기획전~")) {
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
