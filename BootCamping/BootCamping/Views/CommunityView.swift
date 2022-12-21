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
                        Text("캠핑 생활")
                            .font(.title2)
                            .fontWeight(.bold)
                    }.padding(.top,20)
                    
                    
                    
                } //타이틀
                
                Rectangle()
                    .frame(height: 1.0, alignment: .bottom)
                    .foregroundColor(Color("lightGray")) //타이틀 구분선
                
                ScrollView(){
                    
                    VStack{
                        
                        VStack{
                            
                            SearchView()
                            
                            Rectangle()
                                .frame(height: 7.0, alignment: .bottom)
                                .foregroundColor(Color("lightGray"))
                                .padding(.top,20)
                            
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
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                        .padding(.vertical,5)
                                        .padding(.horizontal,8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.gray, lineWidth: 0.5)
                                            )
                                    } //글 종류 버튼

                                }
                                
                            }
                            
                        } .padding(.horizontal,20)
                        
                        
                        
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
