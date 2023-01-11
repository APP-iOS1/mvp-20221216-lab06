//
//  CustomTabView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/26.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var selectedTab: Tab
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            Color("Color0")
                .ignoresSafeArea()
            // ModalView(isShowing: $showModal)
                HStack {
                    Group {
                        Spacer()
                        Button {
                            selectedTab = .first
                        } label: {
                            VStack{
                                Image(systemName: "flame.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                Text("메인")
                                    .font(.caption2)
                            }
                            .foregroundColor(selectedTab == .first ? .black : .gray)
                        }
                    }
                    Spacer()
                    
                    Button {
                        selectedTab = .second
                    } label: {
                        VStack{
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("플레이스")
                                .font(.caption2)
                        }
                        .foregroundColor(selectedTab == .second ? .black : .gray)
                    }

                    Spacer()
                    
                    Button {
                        selectedTab = .third
                        showModal.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 80, height: 80)
                                .shadow(radius: 2)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                        }
                        .offset(y: -30)
//                        .sheet(isPresented: $showModal) {
//                            AddChoiceView(isShowing: .constant(true))
//                                .presentationDetents([.medium])
//                        }
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedTab = .forth
                    } label: {
                        VStack {
                            Image(systemName: "tent")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("캠핑생활")
                                .font(.caption2)
                        }
                        .foregroundColor(selectedTab == .forth ? .black : .gray)
                    }
                    
                    
                    Spacer()
                
                    Button {
                        selectedTab = .fifth
                    } label: {
                        VStack {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("마이캠핑")
                                .font(.caption2)
                        }
                        .foregroundColor(selectedTab == .fifth ? .black : .gray)
                    }
                    
                    Spacer()
                    
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.first))
    }
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

//        TabView(selection: $tabSelection) {
//            NavigationStack {
//                HomeView()
//            }.tabItem {
//                Image(systemName: "flame.fill")
//                Text("메인")
//            }.tag(1)
//            NavigationStack {
//                NewPlaceView().environmentObject(PlaceStore())
//            }.tabItem {
//                Image(systemName: "mappin.and.ellipse")
//                Text("플레이스")
//            }.tag(2)
//            NavigationStack {
//                AddChoiceView(tabSelection: $tabSelection, photoPostStore: photoPostStore, communityPostStore: CommunityPostStore())
//            }.tabItem {
//                Image(systemName: "plus")
//                Text("글쓰기")
//            }.tag(3)
//            NavigationStack {
//                CommunityView()
//            }.tabItem {
//                Image(systemName: "tent")
//                Text("캠핑생활")
//            }.tag(4)
//            NavigationStack {
//                MyCampingView(photoPostStore: photoPostStore, communityPostStore: communityPostStore, tabSelection: $tabSelection)
//            }.tabItem {
//                Image(systemName: "person")
//                Text("마이캠핑")
//            }.tag(5)
//        }
//    }
