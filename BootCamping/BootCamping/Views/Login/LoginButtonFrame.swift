//
//  LoginButtonFrame.swift
//  Semosomo
//
//  Created by sole on 2022/12/13.
//

import SwiftUI


@ViewBuilder
func loginButtonFrame(title: String) -> some View{
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 360, height: 60)
        .overlay{
            Text("\(title)")
                .foregroundColor(.black)
                .font(.headline)
//                .bold()
                
        }
}

