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
                    Image("camp")
                        .resizable()
                        .frame(width: 393, height: 100)
                        .padding(.top, -40)
                    SearchView()
                        .padding(.top, 10)
                    SelectPlaceView()
                    HashTagPlaceView()
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("플레이스")
                        .font(.title2).bold()
                        .accessibilityAddTraits(.isHeader)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Text("북마크").font(.caption).bold()
                    }
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
