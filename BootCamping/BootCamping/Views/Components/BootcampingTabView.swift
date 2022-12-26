//
//  TabView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI

enum Tab {
    case first
    case second
    case third
    case forth
    case fifth
}

struct BootcampingTabView: View {
    @State private var tabSelection: Tab = .first
    @StateObject var photoPostStore: PhotoPostStore = PhotoPostStore()
    @StateObject var communityPostStore: CommunityPostStore = CommunityPostStore()
    
    var body: some View {
        VStack {
            switch tabSelection {
            case .first:
                NavigationStack {
                    HomeView()
                }
            case .second:
                NavigationStack {
                    NewPlaceView().environmentObject(PlaceStore())
                }
            case .third:
                NavigationStack {
                    AddChoiceView(tabSelection: .constant(3), photoPostStore: photoPostStore, communityPostStore: CommunityPostStore())
                }
            case .forth:
                NavigationStack {
                    CommunityView()
                }
            case .fifth:
                NavigationStack {
                    MyCampingView(photoPostStore: photoPostStore, communityPostStore: communityPostStore, tabSelection: .constant(5))
                }
            }
            CustomTabView(selectedTab: $tabSelection)
                .frame(height: 38)
        }
    }
}

struct BootcampingTabView_Previews: PreviewProvider {
    static var previews: some View {
        BootcampingTabView()
    }
}
