//
//  SettingView.swift
//  BootCamping
//
//  Created by 차소민 on 2022/12/21.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var authStore: AuthStore
    
    var body: some View {
        List{
            NavigationLink(destination: MyPageView()) {
                Text("내 정보 관리")
            }
            NavigationLink(destination: TermsOfServiceView()) {
                Text("서비스 이용 약관")
            }
            NavigationLink(destination: PrivacyPolicyView()) {
                Text("개인정보 처리방침")
            }
            NavigationLink(destination: LicenseView()) {
                Text("라이선스")
            }
            Text("회원탈퇴")
            Text("앱 관리")
            Button {
                Task {
                    await authStore.signOut()
                }
            } label: {
                Text("로그아웃")
            }

        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("설정")
                    .font(.headline)
            }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingView().environmentObject(AuthStore())
        }
    }
}
