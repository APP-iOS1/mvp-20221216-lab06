//
//  HomeView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/19.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case top = "오늘의 캠핑"
    case follow = "캠핑 피드"
}

struct HomeView: View {
    @State private var selectedPicker: tapInfo = .top
    @Namespace private var animation
    
    var body: some View {
        VStack{
            animate()
            mainTapView(mainTap: selectedPicker)
        }
    }
    
    @State private var isSheeting: Bool = false
    @ViewBuilder
    
    private func animate() -> some View {
        VStack {
            HStack {
                Button {
                    isSheeting.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .font(.title3)
                }
                .padding(.leading, 5)
                
                Spacer()
                
                ForEach(tapInfo.allCases, id: \.self) { item in
                    VStack {
                        Text(item.rawValue)
                            .font(.callout)
                            .kerning(-1)
                            .frame(maxWidth: 200, maxHeight: 20)
                            .foregroundColor(selectedPicker == item ? .black : .gray)
                        
                        if selectedPicker == item {
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "info", in: animation)
                        }
                        
                    }
                    .frame(width: 90)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedPicker = item
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    isSheeting.toggle()
                } label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(.black)
                        .font(.title3)
                }
                .padding(.trailing, 5)
                
            }
            .padding(15)
        }
    }
}

struct mainTapView : View {
    var mainTap : tapInfo
    var body: some View {
        VStack {
            switch mainTap {
            case .top:
                TodaysCamping()
            case .follow:
                FollowersPhoto()
                Divider()
                FollowerPhotoList()
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
