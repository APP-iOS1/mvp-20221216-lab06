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
        .frame(width: 280, height: 60)
        .foregroundColor(.red)
        .overlay{
            Text("\(title)")
                .foregroundColor(.white)
                .font(.headline)
//                .bold()
                
        }
}

@ViewBuilder
func signupButtonFrame(title: String) -> some View{
    RoundedRectangle(cornerRadius: 10)
        .frame(width: 320, height: 55)
        .overlay{
            Text("\(title)")
                .foregroundColor(.white)
                .font(.headline)
//                .bold()
                
        }
}
