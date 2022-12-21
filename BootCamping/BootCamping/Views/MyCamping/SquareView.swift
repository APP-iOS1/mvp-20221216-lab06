//
//  SquareView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import SwiftUI

struct SquareView: View {
    var photoCards = ["1", "2", "3","4","5","6","7","8","9","10","11","12","13","14"]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<homeImage.count, id: \.self) { index in
//                    ZStack {
                        Image(homeImage[index])
                                .resizable()
                                .frame(width: 198, height: 198)
                            .padding(.bottom, -9)
                        
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

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
    }
}
