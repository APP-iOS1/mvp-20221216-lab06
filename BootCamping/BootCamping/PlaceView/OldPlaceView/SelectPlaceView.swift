//
//  SelectPlaceView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/20.
//

import SwiftUI

struct SelectPlaceView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    struct Local {
        var image = Array(repeating: "circle", count: 5)
        var placeName = ["경기/인천권", "충청권", "경상/부산권", "전라/제주권", "강원권"]
    }
    //수정중
    var local = Local()
    
    var body: some View {
        VStack {
            HStack {
                Text("지역 선택")
                    .font(.title2)
                    .bold()
                    .padding()
                Spacer()
            }
            
            LazyVGrid(columns: columns) {
                ForEach(0..<local.placeName.count) { i in
                    VStack {
                        NavigationLink {
                            PlaceListView().environmentObject(PlaceStore())
                        } label: {
                            Image(systemName: "\(local.image[i])")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .aspectRatio(contentMode: .fit)
                            Text("\(local.placeName[i])")
                                .font(.subheadline)
                        }
                    }
                }
                
            }
        }
        .padding(.vertical, 5)
    }
}

struct SelectPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPlaceView()
    }
}
