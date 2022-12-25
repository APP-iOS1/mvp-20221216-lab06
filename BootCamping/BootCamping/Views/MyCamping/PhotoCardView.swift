//
//  PhotoCardView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import SwiftUI

struct PhotoCardView: View {
    var homePhotoCards = ["photoCard1", "photoCard2", "photoCard3", "photoCard3"]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @ObservedObject var listStore: ListStore = ListStore()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(listStore.listData, id: \.id) { item in
                    NavigationLink {
//                        ArticleDetailView()
                    } label: {
                        ZStack(alignment: .leading) {
                            item.image.first?.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 620)
                                .cornerRadius(20)
                            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                                .cornerRadius(20)
                            PhotoMainStory(listStruct: item)
                                .offset(y: -150)
                        }
                        .frame(width: 300, height: 620)
                        .shadow(radius: 3)
                        .padding(10)
                    }
                }
            }
        }
    }
}

struct PhotoMainStory: View {
    var listStruct: ListStruct
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(listStruct.date)
                    .font(.headline)

               Text(listStruct.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 15)
                
                Text(listStruct.title)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .kerning(-0.7)
            .padding(.horizontal)
        }
    }
}

struct PhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PhotoCardView(listStore: ListStore())
        }
    }
}
