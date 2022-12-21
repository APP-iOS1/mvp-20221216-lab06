//
//  SquareView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import SwiftUI
import FirebaseAuth

struct SquareView: View {
    var homeImage = ["photoCard1", "photoCard2", "photoCard3", "1", "2", "3", "4", "5", "6", "7"]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @StateObject var photoPostStore: PhotoPostStore
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(photoPostStore.photoPost.filter { $0.userID == Auth.auth().currentUser?.uid }, id: \.id) { photo in
//                    ZStack {
                    AsyncImage(url: URL(string: photo.photos)) { image in
                                      image
                            .resizable()
                            .frame(width: 198, height: 198)
//                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }.padding(.bottom, -9)
                        
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
                }
            }   //LazyVGrid

            .padding(.bottom)
            
        }
    }
}

struct AsyncImageComponent: View {
    
    var photoPost: PhotoPost
    
    var body: some View {
//        AsyncImage(url: URL(string: photoPost.photos)) { image in
                          image
                .resizable()
                .frame(width: 198, height: 198)
//                            .scaledToFill()
        } placeholder: {
            ProgressView()
        }.padding(.bottom, -9)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(photoPostStore: PhotoPostStore())
    }
}
