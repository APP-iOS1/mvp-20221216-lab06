//
//  MyCampingView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/20.
//

import SwiftUI

enum tapMypage : String, CaseIterable {
    case myCamping = "나의 캠핑 이야기"
    case likeFeed = "좋아요한 피드"
    case bookmarkPlace = "북마크 플레이스"
}

struct MyCampingView: View {
    @State private var selectedPicker2: tapMypage = .myCamping
    @Namespace private var animation
    
    @State private var isSquare: Bool = false
    @State private var isRectangle: Bool = false
    @State private var isPhotoCard: Bool = true
    @State private var isList: Bool = false
    
    var body: some View {
        VStack{
            animate()
            myPageTapView(myTap: selectedPicker2)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        VStack {
            HStack {
                Image("thekoon_")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("CampingUser")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom, 3)
                    
                    HStack {
                        Button {
                           // FollowListView()
                        } label: {
                            Text("팔로워 4")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        
                        Button {
                        } label: {
                            Text("팔로잉 2")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            // 탭뷰
            HStack {
                ForEach(tapMypage.allCases, id: \.self) { item in
                    VStack {
                        Text(item.rawValue)
                            .font(.callout)
                            .kerning(-1)
                            .frame(maxWidth: 120, maxHeight: 20)
                            .foregroundColor(selectedPicker2 == item ? .black : .gray)
                        
                        if selectedPicker2 == item {
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "info", in: animation)
                        }
                    }
                    .frame(width: 100)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedPicker2 = item
                        }
                    }
                }
            }
            Divider()
            
            // 뷰 체인지 버튼
            HStack{
                Spacer()
                Button {
                    isSquare = true
                    isRectangle = false
                    isPhotoCard = false
                    isList = false
                } label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .foregroundColor(isSquare ? .accentColor : .gray)
                        .font(.headline)
                }
                
                Button {
                    isSquare = false
                    isRectangle = true
                    isPhotoCard = false
                    isList = false
                } label: {
                    Image(systemName: "rectangle.grid.1x2.fill")
                        .foregroundColor(isRectangle ? .accentColor : .gray)
                        .font(.headline)
                }
                
                Button {
                    isSquare = false
                    isRectangle = false
                    isPhotoCard = true
                    isList = false
                } label: {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait.fill")
                        .foregroundColor(isPhotoCard ? .accentColor : .gray)
                        .font(.headline)
                }
                
                Button {
                    isSquare = false
                    isRectangle = false
                    isPhotoCard = false
                    isList = true
                } label: {
                    Image(systemName: "list.bullet")
                        .foregroundColor(isList ? .accentColor : .gray)
                        .font(.headline).bold()
                }
            }.padding(.trailing)
            
            if isSquare {
                SquareView()
            } else if isRectangle {
                RectangleView()
            } else if isPhotoCard {
                PhotoCardView()
            } else if isList {
                ListView()
            }
            
        }
        
        Spacer()
        }
    }



struct myPageTapView : View {
    var myTap : tapMypage
    var body: some View {
        VStack {
            switch myTap {
            case .myCamping:
                EmptyPostView()
                    .padding(.bottom, 250)
           //       TodaysCamping()

            case .likeFeed:
                FollowerPhotoList()
            case .bookmarkPlace:
                EmptyView()

                
            }
        }
    }
}

struct MyCampingView_Previews: PreviewProvider {
    static var previews: some View {
        MyCampingView()
    }
}
