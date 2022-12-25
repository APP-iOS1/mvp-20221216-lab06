//
//  PlaceView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/20.
//

import SwiftUI

struct NewPlaceView: View {

    @State private var isFavorite: Bool = false
    var body: some View {
        
        NavigationStack {
            
            VStack{
                ScrollView {
                    Image("campingAd")
                        .resizable()
                        .frame(width: 393, height: 180)
                        .padding(.top, -40)
                    SearchView()
                        .padding(.vertical, 10)
                        
                    SelectPlaceView()
                        .padding(.vertical, 10)
                        .padding(.bottom, 10)
                    HashTagPlaceView()
                        .padding(.bottom, 20)
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("플레이스")
                        .modifier(TitleViewModifier())
                }
            }
        }
    }
}

struct NewPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceView()
    }
}
