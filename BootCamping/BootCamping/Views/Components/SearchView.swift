//
//  SearchView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/20.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        
          HStack {
            Image(systemName: "magnifyingglass")
                .font(.title3)
                .padding(.leading, 10)
            
            TextField("갬성한 캠핑 어디서 할까요?", text: $searchText)
                .foregroundColor(.gray)
            
            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            } else {
                EmptyView()
            }
            
            NavigationLink {
                NewPlaceView()
            } label: {
                Image(systemName: "arrow.right.circle")
                    .font(.title3)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 10)
        }
          .frame(width: 350, height: 50)
          .background(
              RoundedRectangle(cornerRadius: 20)
                  .foregroundColor(.white)
                  .shadow(color: .black, radius: 1)
                  .opacity(0.4)
          )
          .padding(.vertical, 5)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
