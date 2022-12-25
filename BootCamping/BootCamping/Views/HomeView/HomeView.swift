//
//  HomeView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/19.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case top = "주간 인기 캠핑"
    case follow = "실시간 캠핑"
}

struct HomeView: View {
    @State private var selectedPicker: tapInfo = .top
    @Namespace private var animation
    
    var body: some View {
        VStack{
            mainTapView(mainTap: selectedPicker)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("logo1")          //앱 로고
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            ToolbarItem(placement: .principal) {
                animate()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isSheeting.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.leading, 5)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @State private var isSheeting: Bool = false
    @ViewBuilder
    
    private func animate() -> some View {
        VStack {
            HStack {
                Spacer()
                
                ForEach(tapInfo.allCases, id: \.self) { item in
                    VStack {
                        Text(item.rawValue)
                            .modifier(TitleViewModifier())
                            .kerning(-1)
                            .frame(maxWidth: 200, maxHeight: 30)
                            .foregroundColor(selectedPicker == item ? .black : .gray)
                            .padding(.top, 10)
                        
                        if selectedPicker == item {
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "info", in: animation)
                        } else if selectedPicker != item {
                            Capsule()
                                .foregroundColor(.white)
                                .frame(height: 2)
                        }
                    }
                    .frame(width: 110)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            self.selectedPicker = item
                        }
                    }
                }
                Spacer()
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
                NavigationStack {
                    PhotoCardView()
                }
            case .follow:
                 FollowerPhotoList()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
