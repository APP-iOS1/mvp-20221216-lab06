//
//  MyCampingView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/20.
//

import SwiftUI
import FirebaseAuth

enum tapMypage : String, CaseIterable {
    case myCamping = "나의 캠핑 이야기"
    case likeFeed = "저장한 게시글"
    case bookmarkPlace = "북마크 플레이스"
}

struct MyCampingView: View {
    
    @StateObject var photoPostStore: PhotoPostStore = PhotoPostStore()
    
    @EnvironmentObject var authStore: AuthStore
    
    @StateObject var photoCommentStore = PhotoCommentStore()
    
    @State private var selectedPicker2: tapMypage = .myCamping
    @Namespace private var animation
    
    
    
    
    var body: some View {
        ScrollView {
            animate()
            myPageTapView(myTap: selectedPicker2)
        }
        .onAppear{
            photoPostStore.fetchPhotoPost()
            photoPostStore.retrievePhotos()
        }
        .refreshable {
            photoPostStore.fetchPhotoPost()
            photoPostStore.retrievePhotos()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingView().environmentObject(AuthStore())
                } label: {
                    Image(systemName: "gearshape").foregroundColor(.black)
                }
            }
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
                Button {
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.brown)
                            .frame(width: 80, height: 30)
                        Text("팔로우")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing, 10)
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
            
            ViewChangeButton(photoPostStore: photoPostStore)
            
            
        }
        
        Spacer()
    }
}




struct ViewChangeButton: View {
    @State private var isSquare: Bool = true
    @State private var isRectangle: Bool = false
    @State private var isPhotoCard: Bool = false
    @State private var isList: Bool = false
    @StateObject var photoPostStore: PhotoPostStore
    
    var body: some View {
        VStack {
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
            // 버튼인데???
            if isSquare {
                SquareView(photoPostStore: photoPostStore)
            } else if isRectangle {
                FollowerPhotoList()
            } else if isPhotoCard {
                PhotoCardView()
            } else if isList {
                EmptyView() // 리스트 아직 없음
            }
        }
    }
}


// 여긴 탭뷰
struct myPageTapView : View {
    var myTap : tapMypage
    var body: some View {
        VStack {
            switch myTap {
            case .myCamping:
                //                EmptyPostView()
                //                    .padding(.bottom, 250)
                //                  SquareView()
                EmptyView()
                
            case .likeFeed:
                EmptyView()
                
                //                FollowerPhotoList()
            case .bookmarkPlace:
                EmptyView()
                
                
            }
        }
    }
}



struct MyCampingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyCampingView()
                .environmentObject(AuthStore())
        }
    }
}
