//
//  CommunityView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI

struct CommunityView: View {
    
    @StateObject var communityPostStore: CommunityPostStore = CommunityPostStore()
    
    struct CommunityButtons {
        var communityButtons = ["캠핑 꿀팁", "중고거래", "질문", "추천", "분실물",  "잡담"]
    }
    
    var communityButtons = CommunityButtons()
    
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack {
                    Button {
                        //TODO: 글 종류 선택 모달 나오게
                    } label: {
                        HStack{
                            Image(systemName: "line.3.horizontal" )
                                .padding(.trailing,-3)
                            Text("글 종류")
                        }
                        .modifier(CommunityButtonViewModifier())
                    }
                    
                    ForEach(communityButtons.communityButtons, id: \.self) { button in
                        Button {
                            //
                        } label: {
                            Text("\(button)")
                                .modifier(CommunityButtonViewModifier())

                        }
                    }
                }.padding()
            }
            
            ScrollView {
                VStack{
                    Divider()
                    
                    VStack{
                        ForEach(communityPostStore.communityPost, id: \.id) { post in
                            NavigationLink(destination: CommunityPostDetailWithCommentView( communityPost: post)) {
                                CommunityPostRow(communityPost: post)
                            }
                        }
                    }
                }
                .onAppear {
                    communityPostStore.fetchCommunityPost()
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("캠핑생활")
                            .modifier(TitleViewModifier())
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SearchSomethingView() ) {
                            Image(systemName: "magnifyingglass")
                                .font(.headline)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


//struct CommunityView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityView()
//    }
//}
