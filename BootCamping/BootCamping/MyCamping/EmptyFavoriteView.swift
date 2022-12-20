//
//  EmptyFavoriteView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/20.
//

import SwiftUI

struct EmptyFavoriteView: View {
    var body: some View {
        VStack {
            Text("캠핑 플레이스를")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, -5)
            Text("북마크 해 보세요")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .frame(width: 120, height: 40)
                    Text("글쓰러 가기")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct EmptyFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFavoriteView()
    }
}
