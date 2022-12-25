////
////  TodaysCamping.swift
////  BootCamping
////
////  Created by 이소영 on 2022/12/19.
////
//
//import SwiftUI
//
//struct TodaysCamping: View {
//    var homeImage = ["photoCard1", "photoCard2", "photoCard3", "1", "2", "3", "4", "5", "6", "7"]
//    let images = ["car", "back", "camp", "gl"]
//    
//    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
//    
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(0..<homeImage.count, id: \.self) { index in
//                    ZStack {
//                        Image(homeImage[index])
//                                .resizable()
//                                .frame(width: 198, height: 198)
//                            .padding(.bottom, -9)
//                        
//                        Rectangle()
//                            .frame(width: 20,height: 20)
//                            .offset(x:-88,y:-88)
//                            .opacity(0.6)
//                            .padding(.bottom, -10)
//                        
//                        Text("\(index+1)")
//                            .font(.subheadline)
//                            .offset(x:-89,y:-85)
//                            .foregroundColor(.white)
//                    }
//                }
//            }   //LazyVGrid
//
//            .padding(.bottom)
//            
//            // 광고배너
//
//            TabView {
//                ForEach(images, id: \.self) { item in
//                    Image(item)
//                        .resizable()
//                        .scaledToFill()
//                }
//            }
//            .tabViewStyle(PageTabViewStyle())
//            .frame(width: 400, height: 220)
//        }
//        
//    }
//    
//}
//
//
//struct TodaysCamping_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            TodaysCamping()
//        }
//    }
//}
