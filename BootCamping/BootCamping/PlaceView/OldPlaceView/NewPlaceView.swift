//
//  PlaceView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/20.
//

import SwiftUI

struct NewPlaceView: View {

    var body: some View {
        
        NavigationStack {
            
            VStack{
                ScrollView {
                    Image(systemName: "rectangle")
                        .resizable()
                        .frame(height: 60)
                        .padding()
                    SearchView()
                    SelectPlaceView()
                    HashTagPlaceView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("플레이스")
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
    }
}

struct NewPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceView()
    }
}
