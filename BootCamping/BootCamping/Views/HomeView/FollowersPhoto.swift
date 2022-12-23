//
//  FollowersPhoto.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/19.
//

import SwiftUI

struct FollowersPhoto: View {
    var homeImage = ["a","b","c","d","e","f","g","h","i","j","k","l"]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var camper = ["_chasomin","chohh02","JJ_ang","outdoorlife.prim","thekoon_","bestagrammm"]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("팔로우중인 캠퍼")
                    .kerning(-1)
                    .padding(.leading)
                Spacer()
                NavigationLink(destination: FollowListView()) {
                    Text("더 보기")
                        .kerning(-1)
                        .font(.subheadline)
                        .padding(.trailing)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(camper, id: \.self) { item in
                        VStack{
                            Image(item)
                                .resizable()
                                .frame(width: 70,height: 70)
                                .cornerRadius(50)
                            Text(item)
                                .font(.caption)
                                .frame(width: 75)
                                .lineLimit(1)
                            
                        }
                    }
                }
            }
            .padding(.bottom,10)
        }
        .frame(width: 393)
        Divider()
    }
}

struct FollowersPhoto_Previews: PreviewProvider {
    static var previews: some View {
        FollowersPhoto()
    }
}
