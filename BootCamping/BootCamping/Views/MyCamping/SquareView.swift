//
//  SquareView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import SwiftUI

struct SquareView: View {
    var homeImage = ["photoCard1", "photoCard2", "photoCard3", "1", "2", "3", "4", "5", "6", "7"]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<homeImage.count, id: \.self) { index in
                        Image(homeImage[index])
                                .resizable()
                                .frame(width: 198, height: 198)
                            .padding(.bottom, -9)
                }
            }
            .padding(.bottom)
            
        }
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
    }
}
