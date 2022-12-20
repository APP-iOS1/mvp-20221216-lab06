//
//  PlaceListView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.
//

import SwiftUI

struct PlaceListView: View {
    var body: some View {
        NavigationStack {
            Text("")
            
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
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView()
    }
}
