//
//  SignUpView.swift
//  Semosomo
//
//  Created by sole on 2022/12/13.
//

import SwiftUI

// 약관동의 뷰
struct TermsView: View {
    // 약관동의 체크박스를 위한
    @State var isAllCheck: Bool = false
    @State var isCheck1 = false
    @State var isCheck2 = false
    @State var isCheck3 = false
    @State var isCheck4 = false
    @State var isCheck5 = false
    @State var isCheck6 = false
    
    // 회원가입 완료버튼으로 화면 내리기 위한
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
                            if isAllCheck {
                                isCheck1 = true
                                isCheck2 = true
                                isCheck3 = true
                                isCheck4 = true
                                isCheck5 = true
                                isCheck6 = true
                            } else {
                                isCheck1 = false
                                isCheck2 = false
                                isCheck3 = false
                                isCheck4 = false
                                isCheck5 = false
                                isCheck6 = false
                            }
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
                                isCheck1.toggle()
                            } label: {
                                Image(systemName: isCheck1 ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck1 ? .red : .gray)
                                
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
                                isCheck2.toggle()
                            } label: {
                                Image(systemName: isCheck2 ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck2 ? .red : .gray)
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
                                isCheck3.toggle()
                            } label: {
                                Image(systemName: isCheck3 ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck3 ? .red : .gray)
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
                                isCheck4.toggle()
                            } label: {
                                Image(systemName: isCheck4 ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck4 ? .red : .gray)
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
                                isCheck5.toggle()
                            } label: {
                                Image(systemName: isCheck5 ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck5 ? .red : .gray)
                            }
                            Text("개인정보 수집 및 이용 동의 (선택)")
                        }
                        .padding(.bottom)
                        
                        HStack{
                            Button {
                                isCheck6.toggle()
                            } label: {
                                Image(systemName: isCheck6 ? "checkmark.square.fill" : "checkmark.square.fill")
                                    .foregroundColor(isCheck6 ? .red : .gray)
                            }
                            Text("이벤트/마케팅 수신 동의(선택)")
                        }
                    }
                    
                }
                .padding([.horizontal, .bottom], 40)
                
                
                // 버튼, 필수 약관 체크 되어있어야지 활성화
                VStack(alignment: .center){
                    if isCheck1 && isCheck2 && isCheck3 && isCheck4 {
                        NavigationLink(destination: SignUpView( isSignUp: $isSignUp)){
                            signupButtonFrame(title: "다음")
                                .foregroundColor(.red)
                        }
                    }else{
                        signupButtonFrame(title: "다음")
                            .foregroundColor(.gray)
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

// 회원가입 뷰
struct SignUpView: View {
    @EnvironmentObject var authStore: AuthStore
    @Binding var isSignUp: Bool
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        Group{
            VStack(alignment: .center) {
                
                VStack(alignment: .leading){
                    Text("회원정보를\n입력해주세요.")
                        .font(.largeTitle.bold())
                    Spacer()
//                    HStack {
//                        Text("이름")
//                        Text("*")
//                            .foregroundColor(.red)
//                    }
//
//                    TextFieldFrameSignUp
//                        .overlay{
//                            TextField("이름", text: $authStore.email)
//                            //이거 일단 email로 해뒀는데 음,,, 이름 필요한가요??
//                        }
//                        .padding(.bottom ,5)
                    
                    Group{ //이메일
                        HStack {
                            Text("이메일")
                            Text("*")
                                .foregroundColor(.red)
                        }
                        TextFieldFrameSignUp
                            .overlay{
                                TextField("이메일", text: $email)
                            }
                        
                        if !email.isEmpty && !(email.range(of: #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]{2,3}+$"#, options: .regularExpression) != nil) {
                            Text("이메일 형식이 맞지 않습니다")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.bottom)
                        } else if !email.isEmpty && (email.range(of: #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]{2,3}+$"#, options: .regularExpression) != nil) {
                            Text("사용가능한 이메일입니다")
                                .font(.caption)
                                .foregroundColor(.green)
                                .padding(.bottom)
                        }
                    }
                    
                    //비밀번호
                    Group{
                        HStack {
                            Text("비밀번호")
                            Text("*")
                                .foregroundColor(.red)
                        }
                        TextFieldFrameSignUp
                            .overlay{
                                SecureField("8자 이상, 숫자/영문/특수문자 필수 포함", text: $password)
                            }
                            .padding(.bottom ,5)
                        if !password.isEmpty && !(password.range(of: "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&()_+=-]).{8,50}$", options: .regularExpression) != nil) {
                            Text("비밀번호 형식이 맞지 않습니다")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.bottom)
                        } else if !password.isEmpty && (password.range(of: "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&()_+=-]).{8,50}$", options: .regularExpression) != nil) {
                            Text("사용가능한 비밀번호입니다")
                                .font(.caption)
                                .foregroundColor(.green)
                                .padding(.bottom)
                        }
                    }
                    
                    //비밀번호 확인
                    Group{
                        TextFieldFrameSignUp
                            .overlay{
                                SecureField("비밀번호 확인", text: $confirmPassword)
                            }
                            .padding(.bottom ,5)
                        if !confirmPassword.isEmpty && password != confirmPassword {
                            Text("비밀번호가 일치하지 않습니다")
                                .font(.caption)
                                .foregroundColor(.red)
                                .padding(.bottom)
                        } else if !confirmPassword.isEmpty && password == confirmPassword {
                            Text("비밀번호가 일치합니다")
                                .font(.caption)
                                .foregroundColor(.green)
                                .padding(.bottom)
                        }
                    }
                    
                    
                    
                    Text("프로필 사진 (선택)")
                    Image(systemName: "square.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                    //일단 네모로 자리만 잡아둘게용
                    Spacer()

                    
                }
                // 버튼, 내용이 전부 채워져있어야 활성화.
                VStack(alignment: .center){
                    if !authStore.email.isEmpty && !authStore.password.isEmpty && !authStore.confirmPassword.isEmpty {
                        NavigationLink(destination: SignUpCompleteView(isSignUp: $isSignUp)){
                            signupButtonFrame(title: "다음")
                                .foregroundColor(.red)
                        }
                    }else {
                        signupButtonFrame(title: "다음")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 60)
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


// 회원가입 완료 뷰
struct SignUpCompleteView: View {
    @EnvironmentObject var authStore: AuthStore
    
    @Binding var isSignUp: Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Image("_chasomin") // 프로필사진
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom)
                Text("회원가입 완료!")
                    .font(.title.bold())
                Text("부트캠핑에 오신 것을 환영합니다!")
                    .font(.title2)
            }
            .padding(.bottom,100)
            
            Button {
                isSignUp = false
            } label: {
                signupButtonFrame(title: "시작하기")
                    .foregroundColor(.red)
            }.task {
                Task{
                    await authStore.signUp()
                }
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




struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SignUpView(isSignUp:.constant(false))
                .environmentObject(AuthStore())
        }
    }
}
