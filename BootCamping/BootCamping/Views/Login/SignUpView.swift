//
//  SignUpView.swift
//  Semosomo
//
//  Created by sole on 2022/12/13.
//

import SwiftUI

struct SignUpView: View {
    @State private var phoneNumber: String = ""
    @State private var AuthNumber: String = ""
    @State private var isCompleteSignUP: Bool = false
    @EnvironmentObject var authStore: AuthStore

    var body: some View {
        NavigationStack{
            
            Spacer()
            
            VStack {
//                HStack {
                    //                    RoundedRectangle(cornerRadius: 10)
                    //                        .stroke(.gray)
                    //                        .frame(width: 281,height: 50)
                    //                        .overlay{
                    //                            TextField(" 전화번호를 입력하세요.", text: $phoneNumber)
                    //                        }
                    //
                    //                    Button(action: {}){
                    //                        RoundedRectangle(cornerRadius: 10)
                    //                            .frame(width: 70, height: 50)
                    //                            .overlay{
                    //                                Text("발송")
                    //                                    .foregroundColor(.black)
                    //                                    .font(.headline)
                    //
                    //                            }
                    //                    }
                    //                }
                    //                .frame(width: 360)
                    //                .padding(5)
                    //                TextFieldFrame
                    //                    .overlay{
                    //                        TextField(" 인증번호를 입력하세요.", text: $AuthNumber)
                    //                            .overlay{
                    //                                HStack {
                    //                                    Spacer()
                    //                                    Text("3:00    ")
                    //                                        .foregroundColor(.red)
                    //                                }
                    //                            }
                    //
                    //                    }
                    TextFieldFrame
                        .overlay{
                            TextField(" 이메일을 입력하세요.", text: $authStore.email)
                        }
                        .padding(5)

                    
                    TextFieldFrame
                        .overlay{
                            SecureField(" 비밀번호를 입력하세요.", text: $authStore.password)
                        }
                        .padding(5)
                    
                    TextFieldFrame
                        .overlay{
                            SecureField(" 비밀번호를 다시 입력하세요.", text: $authStore.confirmPassword)
                        }
                        .padding(5)
                    
                    
                    
//                    NavigationLink(destination: {SignUpDetailView()} ){
//                        SignUpButtonFrame
//                            .padding(.top, 40)
//
//                    }
                Button {
                    Task{
                        await authStore.signUp()
                    }
                } label: {
                    SignUpButtonFrame
                }
                .padding(.top, 40)


//                }
            }
            Spacer()
                .navigationTitle("함께하다")
        }
    }
    
    private var SignUpButtonFrame: some View{
        loginButtonFrame(title: "함께하다")
    }
}


struct SignUpDetailView: View{
    @State var name: String = ""
    @State var password: String = ""
    @EnvironmentObject var authStore: AuthStore

    var body: some View{
        VStack{
            TextFieldFrame
                .overlay(alignment: .leading){
                    Text(" 010-1234-1234")
                        .foregroundColor(.gray)
                }
            
            TextFieldFrame
                .overlay{
                    TextField(" 이름을 입력하세요", text: $name)
                }
            TextFieldFrame
                .overlay{
                    SecureField(" 비밀번호를 입력하세요.", text: $password)
                }
            
            TextFieldFrame
                .overlay{
                    SecureField(" 비밀번호를 한 번 더 입력하세요.", text: $password)
                }
            Button(action: {}) {
                SignUpButtonFrame
                    .padding(.top, 40)
            }
            
        }
        .navigationTitle("당신의 정보 입력")
    }
    
    private var SignUpButtonFrame: some View{
        loginButtonFrame(title: "입력하다")
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthStore())
    }
}
