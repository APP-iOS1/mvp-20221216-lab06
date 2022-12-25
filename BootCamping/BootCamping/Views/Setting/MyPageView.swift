//
//  MyPageView.swift
//  BootCamping
//
//  Created by 차소민 on 2022/12/21.
//

import SwiftUI

struct MyPageView: View {

    var follower = 5
    var following = 5
    var email = "bootcamping@test.com"
    @State private var password = ""
    @State private var newPassword = ""
    @State private var checkNewPassword = ""
    
    var body: some View {
            VStack(alignment:.leading){
                
                //프로필 사진
                HStack {
                    HStack{
                            Spacer()
                                .frame(width: 30)
                            
                            Image("_chasomin")      //실제유저 프로필사진 들어가야하고
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                                .padding(.trailing)
                            VStack(alignment: .leading){
                                Text("UserName")    //여기도
                                    .font(.title3.bold())
                                Text("팔로워 \(follower) | 팔로잉 \(following)")
                            }
                            Spacer()
                                .frame(width: 30)
                            
                        }
                    Spacer()
                }
                .padding(10)

                
                
                // 이메일
                    HStack{
                        Spacer()
                            .frame(width: 30)

                        Text("이메일")
                            .bold()
                        Spacer()
                        Text("\(email)")
                        Spacer()
                            .frame(width: 30)

                    }
                    .padding(10)

                
                
                
                // 비밀번호 재설정
                HStack {
                    Spacer()
                        .frame(width: 30)
                    
                    VStack(alignment: .leading){
                        Text("비밀번호 재설정")
                            .bold()
                        TextFieldFrameSignUp
                            .overlay{
                                TextField("기존 비밀번호를 입력해주세요", text: $password)
                            }
                        TextFieldFrameSignUp
                            .overlay{
                                TextField("재설정할 비밀번호를 입력해주세요", text: $newPassword)
                            }
                        TextFieldFrameSignUp
                            .overlay{
                                TextField("비밀번호를 재입력해주세요", text: $checkNewPassword)
                            }
                    }
                    
                    Spacer()
                        .frame(width: 30)
                }
                .padding(10)
                
                HStack{
                    Spacer()
                        .frame(width: 30)
                    NavigationLink("탈퇴하기") {
                        Text("탈퇴하기")
                    }.padding(10)
                    Spacer()
                        .frame(width: 30)
                }.padding(.vertical, 10)

                
                //버튼
                HStack {
                    
                    Spacer()
                    
                    Button {
                        //동작없음
                    } label: {
                        Rectangle()
                            .cornerRadius(10)
                            .frame(width: 100, height: 30)
                            .foregroundColor(.black)
                            .overlay{
                                Text("변경하기")
                                    .foregroundColor(.white)
                            }
                    }
                }
                .padding(.horizontal, 34)
                Spacer()

            }// 전체 VStack 끝
            .padding(5)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("내 정보 관리")
                        .font(.headline)
                }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
