//
//  TabView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI

struct BootcampingTabView: View {
    @State var tabSelection = 1
    @StateObject var photoPostStore: PhotoPostStore = PhotoPostStore()

    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationStack {
                HomeView()
            }.tabItem {
                Text("홈")
            }.tag(1)
            NavigationStack {
                NewPlaceView().environmentObject(PlaceStore())
            }.tabItem {
                Text("플레이스")
            }.tag(2)
            NavigationStack {
                AddView(photoPostStore: photoPostStore, tabSelection: $tabSelection)
            }.tabItem {
                Text("글쓰기")
            }.tag(3)
            NavigationStack {
             CommunityView()
            }.tabItem {
                Text("커뮤니티")
            }.tag(4)
            NavigationStack {
                MyCampingView()
            }.tabItem {
                Text("마이캠핑")
            }.tag(5)
            
            
        }
    }
}

struct BootcampingTabView_Previews: PreviewProvider {
    static var previews: some View {
        BootcampingTabView()
    }
}
