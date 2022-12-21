//
//  FollowListView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/19.
//

import SwiftUI

struct FollowListView: View {
    @State var followerCamper = ["_chasomin","chohh02","JJ_ang","outdoorlife.prim","thekoon_","bestagrammm"]
    @State var followingCamper = ["chohh02","JJ_ang","outdoorlife.prim","thekoon_","bestagrammm"]
    @State var isFollower: Bool = true
    @State var isFollowing : Bool = false
    
    var body: some View {
        VStack {
          //   팔로워,팔로잉 버튼
            HStack{
                Button {
                    isFollower = true
                    isFollowing = false
                } label: {
                    if isFollower {
                        ZStack{
                            Rectangle()
                                .frame(width: 70, height: 30)
                                .foregroundColor(Color.accentColor)
                                .cornerRadius(5)
                            Text("팔로워 \(followerCamper.count)")
                                .foregroundColor(.white)
                        }
                    } else {
                        Text("팔로워 \(followerCamper.count)")
                            .frame(width: 70, height: 30)
                    }
                }
                .padding()
                Button {
                    isFollower = false
                    isFollowing = true
                } label: {
                    if isFollowing {
                        ZStack{
                            Rectangle()
                                .frame(width: 70, height: 30)
                                .foregroundColor(Color.accentColor)
                                .cornerRadius(5)
                            Text("팔로잉 \(followingCamper.count)")
                                .foregroundColor(.white)
                        }
                    } else {
                        Text("팔로잉 \(followingCamper.count)")
                            .frame(width: 70, height: 30)

                    }
                }
                .padding()
            }
            
            // 친구목록 리스트
            //팔로워
            if isFollower {
                List{
                    ForEach (followerCamper, id: \.self) { item in
                        HStack{
                            Image("\(item)")
                                .resizable()
                                .frame(width: 50,height: 50)
                            Text("\(item)")
                            Spacer()
                            Text("<")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            //팔로잉
            if isFollowing {
                List{
                    ForEach (followingCamper, id: \.self) { item in
                        HStack{
                            Image(item)
                                .resizable()
                                .frame(width: 50,height: 50)
                            Text(item)
                            Spacer()
                            Text("<")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        

    }
}
struct FollowListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FollowListView()
        }
    }
}
