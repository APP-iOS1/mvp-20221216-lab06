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
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(listStore.listData, id: \.id) { item in
                    
                    NavigationLink {
                        PhotoDetailView(listStruct: item)
                    } label: {
                        ZStack(alignment: .leading) {
                            item.image.first?.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 600)
                                .cornerRadius(20)
                            PhotoMainStory(listStruct: item)
                                .offset(y: -150)
                        }
                        .shadow(radius: 3)
                        .padding()
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
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 1.0)
                
                Text(listStruct.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 3.0)
                
                Text(listStruct.title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 15.0)
                
            }
        }
    }
}

struct PhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCardView()
    }
}
