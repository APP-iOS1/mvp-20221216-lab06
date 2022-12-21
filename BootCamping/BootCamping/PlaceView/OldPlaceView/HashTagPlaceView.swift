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
        var address = ["난지캠핑장 주소", "담양힐링파크 주소", "망원캠핑장 주소", "합정캠핑장 주소", "성수캠핑장 주소"]
    }
    
    var hashTagPlace = HashTagPlace()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("#불멍 캠핑 성지")
                    .font(.title2)
                    .bold()
                    .padding()
                Spacer()
            }
            
            LazyVGrid(columns: columns) {
                ForEach(0..<5) { i in
                    VStack {
                        Image(systemName: "\(hashTagPlace.image[i])")
                            .resizable()
                            .frame(width:150, height: 150)
                            .aspectRatio(contentMode: .fit)
                        HStack {
                            Image(systemName: "star.fill").renderingMode(.original)
                            Text("\(hashTagPlace.stars[i])")
                            Text("(후기4개)").font(.caption)
                        }
                        Text("\(hashTagPlace.placeName[i])")
                            .font(.subheadline)
                        Text("\(hashTagPlace.address[i])")
                            .padding(.bottom, 15)
                    }
                }

            }
        }
        .padding(.vertical, 5)
    }
}

struct HashTagPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        HashTagPlaceView()
    }
}
