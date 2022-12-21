//
//  TermsOfServiceView.swift
//  BootCamping
//
//  Created by 차소민 on 2022/12/21.
//

import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 10)
            VStack(alignment:.leading){
                Group{
                    Text("제 1 장")
                        .bold()
                    VStack(alignment: .leading){
                        Text("  제 1 조 (목적)")
                        Text("  제 2 조 (약관의 효력 및 변경)")
                        Text("  제 3 조 (약관 외 준칙)")
                        Text("  제 4 조 (용어의 정의)")
                    }
                    .font(.callout)
                    .padding(.bottom)
                    
                    Text("제 2 장")
                        .bold()
                    VStack(alignment: .leading){
                        Text("  제 5 조 (계약의 성립)")
                        Text("  제 6 조 (계정 이용의 제한)")
                    }
                    .font(.callout)
                    .padding(.bottom)
                    
                    
                    Text("제 3 장")
                        .bold()
                    VStack(alignment: .leading){
                        Text("  제 7 조 (계정 제공)")
                        Text("  제 8 조 (서비스의 변경 및 종료)")
                        Text("  제 9 조 (계정 관리)")
                        Text("  제 10 조 (인증서비스)")
                    }
                    .font(.callout)
                    .padding(.bottom)
                    
                    
                    Text("제 4 장")
                        .bold()
                    VStack(alignment: .leading){
                        Text("  제 11 조 (회원의 의무)")
                        Text("  제 12 조 (개인정보의 보호)")
                        Text("  제 13 조 (회원에 대한 통지 및 공지)")
                    }
                    .font(.callout)
                    .padding(.bottom)
                    
                    Text("제 5 장")
                        .bold()
                    VStack(alignment: .leading){
                        Text("  제 14 조 (이용계약 해지)")
                        Text("  제 15 조 (손해배상)")
                        Text("  제 16 조 (분쟁의 해결)")
                    }
                    .font(.callout)
                    .padding(.bottom)
                }


                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("서비스 이용 약관")
                        .font(.headline)
                }
        }
    Spacer()
        }
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
