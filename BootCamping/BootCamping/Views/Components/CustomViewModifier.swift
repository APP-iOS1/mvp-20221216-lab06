//
//  CustomViewModifier.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/25.
//

import SwiftUI

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title3, weight: .semibold))
            .accessibilityAddTraits(.isHeader)
    }
}

struct CommunityButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.gray)
            .fontWeight(.medium)
            .padding(.vertical,8)
            .padding(.horizontal,9)
            .overlay (
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}



/*
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
                Text("북마크").font(.headline).bold()
            }
        }
    }
*/
