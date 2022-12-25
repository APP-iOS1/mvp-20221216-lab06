//
//  HashTagPlaceView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/20.
//

import SwiftUI

struct HashTagPlaceView: View {
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    struct HashTagPlace {
        var image = Array(repeating: "rectangle", count: 5)
        var stars = ["5.0", "4.0", "3.0", "2.0", "1.0"]
        var placeName = ["난지캠핑장", "담양힐링파크", "망원캠핑장", "합정캠핑장", "성수캠핑장"]
        var address = ["난지캠핑장 주소 123123123", "담양힐링파크 주소 123123", "망원캠핑장 주소123213", "합정캠핑장 주소 123-12313", "성수캠핑장 주소12312-3123"]
        var placeImage = ["13","14","10","11","12"]
    }
    
    var hashTagPlace = HashTagPlace()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("🔥불멍 캠핑 성지")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal,20)
                Spacer()
            }.padding(.bottom, -10)
            
            LazyVGrid(columns: columns) {
                ForEach(0..<5) { i in
             
                    VStack(alignment: .leading) {
                        Image("\(hashTagPlace.placeImage[i])")
                            .resizable()
                            .frame(width:175, height: 175)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "star.fill").renderingMode(.original)
                                    .font(.footnote)
                                Text("\(hashTagPlace.stars[i])")
                                    .font(.footnote)
                                    .padding(.leading, -4)
                                Text("( + 25 )").font(.caption).padding(.leading, -4)
                            }.padding(.vertical,1)
                                
                            
                            Text("\(hashTagPlace.placeName[i])")
                                .font(.headline)
                                .fontWeight(.semibold)
                                

                            Text("\(hashTagPlace.address[i])")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.bottom, 15)
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            .padding()
        }
    }
}

struct HashTagPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        HashTagPlaceView()
    }
}
