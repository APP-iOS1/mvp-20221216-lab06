//
//  PlaceListView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI


enum tapInfo : String, CaseIterable {
    case top = "오늘의 캠핑"
    case follow = "캠핑 피드"
}

struct PlaceListView: View {
    @State private var selectedPicker: tapInfo = .top
    @Namespace private var animation
    
    var body: some View {
        NavigationStack {
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
}
struct mainTapView : View {
    var mainTap : tapInfo
    var body: some View {
        VStack {
            switch mainTap {
            case .top:
                //                    TodaysCamping()
            case .follow:
                //                    FollowersPhoto()
                Divider()
                //                    FollowerPhotoList()
                
            }
        }
    }
}

    .toolbar {
        ToolbarItem(placement: .principal) {
            Text("커뮤니티")
                .font(.title).bold()
                .accessibilityAddTraits(.isHeader)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                //TODO: 북마크 구현
            } label: {
                Text("북마크")
            }
        }
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView()
    }
}
