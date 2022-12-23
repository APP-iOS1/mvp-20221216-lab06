////
////  CommunityCategoryView.swift
////  BootCamping
////
////  Created by 김혜지 on 2022/12/21.
////
//
//import SwiftUI
//
//struct CommunityCategoryView: View {
//    
//    @StateObject var communityPostStore: CommunityPostStore
//    
//    var body: some View {
//        VStack{
//            
//            VStack{
//                
//                HStack(alignment: .center){
//                    Text("캠핑 꿀팁")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }.padding(.top,20)
//                
//            } //타이틀
//
//            
//            Rectangle()
//                .frame(height: 1.0, alignment: .bottom)
//                .foregroundColor(Color("lightGray")) //타이틀 구분선
//            
//            
//            VStack{
//                ForEach(communityPostStore.communityPost, id: \.id) { post in
//                    NavigationLink(destination: CommunityPostDetailWithCommentView( communityPost: post)) {
//                                            CommunityPostView()
//                    }
//                }
//               
//                
//            }
//            
//        }
//    }
//}
//
//struct CommunityCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityCategoryView()
//    }
//}
