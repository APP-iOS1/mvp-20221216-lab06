//
//  AuthStore.swift
//  Semosomo
//
//  Created by 차소민 on 2022/12/14.
//

import Foundation
import FirebaseAuth

class AuthStore: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    // 체크용 - 이메일 형식 맞는지 Mr. 정
    func checkAuthFormat() -> Bool {
        let emailRegex = "^([a-zA-Z0-9._-])+@[a-zA-Z0-9.-]+.[a-zA-Z]{3,20}$"
        return email.range(of: emailRegex, options: .regularExpression) != nil
        
    }
    
    // 확인하다 - 비밀번호 형식 맞는지, 두 개 동일한지
    func checkPasswordFormat() -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&()_+=-]).{8,50}$"
        return password.range(of: passwordRegex, options: .regularExpression) != nil
        
        if password != confirmPassword {
            return false
        }else {
            return password.range(of: passwordRegex, options: .regularExpression) != nil
        }
        
    }

    
    //로그인
    func signIn() async -> Bool{
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            return true
        }
        catch {
            print(error)
            return false
        }
    }
    
    
    //로그아웃
    func signOut() async -> Bool {
        do {
            try await Auth.auth().signOut()
            return true
        }
        catch {
            print(error)
            return false
        }
    }
    
    
    //회원가입
    func signUp() async -> Bool {
        if checkPasswordFormat() && checkAuthFormat(){
            
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                return true
            }
            catch {
                print(error)
                return false
                
            }
            
        } else {
            print("password: \(password), confirmPassword: \(confirmPassword), email: \(email)")
            return false
        }
        
    }
    
    
}
