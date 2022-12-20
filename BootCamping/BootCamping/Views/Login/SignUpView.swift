//
//  SignUpView.swift
//  Semosomo
//
//  Created by sole on 2022/12/13.
//

import SwiftUI

//전체동의는 되는데 개별동의 안됨.
struct TermsView: View {
    @State var isAllCheck: Bool = false
    @State var isCheck: Bool = false
    @Binding var isSignUp: Bool

    var body: some View {
        NavigationStack {
            Group {
                VStack(alignment:.leading){
                    Text("가입약관을 읽고\n동의해주세요.")
                        .font(.largeTitle.bold())
                        .padding(.bottom)
                    
                    Text("약관동의")
                        .font(.title3.bold())
                        .padding(.bottom)
                    
                    HStack{
                        Button {
                            isAllCheck.toggle()
                        } label: {
                            Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                .foregroundColor(isAllCheck ? .red : .gray)
                        }
                        Text("전체동의")
                    }
                    Divider()
                    Group{
                        HStack{
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isAllCheck ? .red : .gray)
                            }
                            HStack {
                                Text("서비스 이용 약관")
                                Text("(필수)")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.bottom)
                        HStack{
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isAllCheck ? .red : .gray)
                            }
                            HStack {
                                Text("개인 정보 수집 및 이용 동의")
                                Text("(필수)")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.bottom)
                        
                        HStack{
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isAllCheck ? .red : .gray)
                            }
                            HStack {
                                Text("개인정보 제 3자 제공 동의")
                                Text("(필수)")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.bottom)
                        
                        HStack{
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isAllCheck ? .red : .gray)
                            }
                            VStack {
                                HStack {
                                    Text("만 14세 이상입니다.")
                                    Text("(필수)")
                                        .foregroundColor(.red)
                                }
                                Text("*미성년자는 서비스 이용이 불가합니다.")
                                    .font(.caption)
                                    .foregroundColor(.red)

                            }
                        }
                        .padding(.bottom)
                        
                        HStack{
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isAllCheck ? .red : .gray)
                            }
                            Text("개인정보 수집 및 이용 동의 (선택)")
                        }
                        .padding(.bottom)
                        
                        HStack{
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isAllCheck ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isAllCheck ? .red : .gray)
                            }
                            Text("이벤트/마케팅 수신 동의(선택)")
                        }
                    }
                    
                }
                .padding()
                VStack(alignment: .center){
                    signupButtonFrame(title: "다음")
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUpView( isSignUp: $isSignUp)){
                        
                        signupButtonFrame(title: "다음")
                            .foregroundColor(.red)
                    }
                }
                .padding(.top, 30)
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("약관동의")
                        .font(.headline)
                }
            }
        }
    }
}

struct SignUpView: View {
//    @State private var phoneNumber: String = ""
//    @State private var AuthNumber: String = ""
    @State private var isCompleteSignUP: Bool = false
    @EnvironmentObject var authStore: AuthStore
    
//    @State var showImagePicker = false
//    @State var image: Image?
//    @State var isPickerShowing: Bool = false
//    @State private var selectedImage: UIImage?
    
//    func loadImage() {
//        guard let selectedImage = selectedImage else { return }
//        image = Image(uiImage: selectedImage)
//    }
    @Binding var isSignUp: Bool

    var body: some View {
        Group{
            
            VStack(alignment: .center) {
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
                
                VStack(alignment: .leading){
                    Text("회원정보를\n입력해주세요.")
                        .font(.largeTitle.bold())
                        .padding(.bottom)
                    HStack {
                        Text("이름")
                        Text("*")
                            .foregroundColor(.red)
                    }
                    
                    TextFieldFrameSignUp
                        .overlay{
                            TextField("이름", text: $authStore.email)
                        }
                        .padding(.bottom ,5)

                    HStack {
                        Text("이메일")
                        Text("*")
                            .foregroundColor(.red)
                    }
                    
                    TextFieldFrameSignUp
                        .overlay{
                            TextField("이메일", text: $authStore.email)
                        }
                        .padding(.bottom ,5)

                    HStack {
                        Text("비밀번호")
                        Text("*")
                            .foregroundColor(.red)
                    }
                    TextFieldFrameSignUp
                        .overlay{
                            SecureField("8자 이상, 숫자/영문/특수문자 필수 포함", text: $authStore.password)
                        }
                        .padding(.bottom ,5)
                    TextFieldFrameSignUp
                        .overlay{
                            SecureField("비밀번호 확인", text: $authStore.confirmPassword)
                        }
                        .padding(.bottom ,5)
                    
                    Text("프로필 사진 (선택)")
//                    Button {
//                        showImagePicker.toggle()
//
//                    } label: {
//                        if let image = image {
//                                        image
//                                            .resizable()
//                                            .clipShape(Circle())
//                                            .frame(width: 70, height: 70)
//                                    } else {
//                                        Image(systemName: "square")
//                                            .resizable()
//                                            .foregroundColor(.blue)
//                                            .frame(width: 70, height: 70)
//                                    }
//                    }
//                    .sheet(isPresented: $showImagePicker, onDismiss: {
//                                    loadImage()
//                                }) {
//                                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
//                            }
                    
                    

                    
                }
                
                
                //                    NavigationLink(destination: {SignUpDetailView()} ){
                //                        SignUpButtonFrame
                //                            .padding(.top, 40)
                //
                //                    }
                VStack(alignment: .center){
                    signupButtonFrame(title: "이건 무슨 버튼인가욤? 둘중택1?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUpCompleteView(isSignUp: $isSignUp)){
                        signupButtonFrame(title: "다음")
                            .foregroundColor(.red)
                    }
                }
                .padding(.top, 60)
                //                Button {
                //                    Task{
                //                        await authStore.signUp()
                //                    }
                //                } label: {
                //                    signupButtonFrame(title: "다음")
                //
                //                }
                //                .padding(.top, 40)
                
                
                //                }
            }

        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("회원정보 입력")
                    .font(.headline)
            }
        }

    }
}
//
//    private var SignUpButtonFrame: some View{
//        loginButtonFrame(title: "함께하다")
//    }

struct SignUpCompleteView: View {
    @Environment(\.presentationMode) var postingRemove
    //한 개만 나가짐
    @Binding var isSignUp: Bool
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Image("") // 프로필사진
                Text("회원가입 완료!")
                    .font(.largeTitle.bold())
                Text("부트캠핑에 오신 것을 환영합니다!")
                    .font(.title2)
            }
            .padding(.bottom,100)
            
            Button {
                isSignUp = false
//                postingRemove.wrappedValue.dismiss()
            } label: {
                signupButtonFrame(title: "시작하기")
                    .foregroundColor(.red)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("회원가입 완료")
                    .font(.headline)
            }
        }

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
        NavigationStack{
            TermsView(isSignUp:.constant(false))
                .environmentObject(AuthStore())
        }
    }
}
