//
//  PrivacyPolicyView.swift
//  BootCamping
//
//  Created by 차소민 on 2022/12/21.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 10)

            VStack(alignment: .leading,spacing: 10){
                Group{
                    Text("1. 개인정보 처리방침")
                    Text("2. 개인정보 수집")
                    Text("3. 개인정보 이용")
                    Text("4. 개인정보 제공")
                    Text("5. 개인정보 파기")
                    Text("6. 개인위치정보의 처리")
                }
                Text("7. 이용자 및 법정대리인의 권리와 행사 방법")
                Text("8. 개인정보 자동 수집 장치에 관한 사항")
                Text("9. 개인정보의 안전성 확보 조치에 관한 사항")
                Text("10. 개인정보 보호책임자 및 고충처리 부서")
                Text("11. 개정 전 고지의무 등 안내")
                Spacer()
            }
            .bold()
            Spacer()
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
