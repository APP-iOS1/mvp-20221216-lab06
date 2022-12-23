//
//  SearchSomethingView.swift
//  BootCamping
//
//  Created by 김혜지 on 2022/12/23.
//

import SwiftUI

struct SearchSomethingView: View {
    var body: some View {
        VStack{
            
            SearchView()
            
            VStack{
                
                ScrollView{
                    VStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("최근 검색어")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            HStack{
                                Text("텐트 추천")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,7)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.gray, lineWidth: 1)
                                    )
                                
                                Text("글램핑 추천")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,7)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.gray, lineWidth: 1)
                                    )
                                
                                
                            }
                            .foregroundColor(.gray)
                            .padding(.vertical,2)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }.padding(.horizontal,23)
                        .padding(.top,10)
                }
                
            }

            
        }.padding(.top,30)
    }
}

struct SearchSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSomethingView()
    }
}
