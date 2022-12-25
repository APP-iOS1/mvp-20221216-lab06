//
//  RectangleView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import SwiftUI

struct RectangleView: View {
    var articles = [
        UserArticle(userImage: "photoCard1", userName: "CampingUser1", userArticle: "얼어죽는 줄 알았는데 생각보다 괜찮았따~~", userTitle: "어제 오랜만에 불멍!"),
        UserArticle(userImage: "photoCard2", userName: "CampingUser2", userArticle: "그치만 동계캠핑은 원래 추운맛에 하는거니까요... ", userTitle: "추워 얼어죽겠네ㅜㅜ"),
        UserArticle(userImage: "photoCard3", userName: "CampingUser3", userArticle: "어제 오션뷰캠핑장 다녀왔어요! 서해안 쪽이라 일몰 짱 예쁘네융", userTitle: "일몰 예쁜 캠핑장 정보📌"),
        UserArticle(userImage: "3", userName: "CampingUser3", userArticle: "술안주는 그리들에 구워먹는 곱창이 짜세...", userTitle: "날 추우니까 술이 안취해☺️"),
        UserArticle(userImage: "1", userName: "CampingUser4", userArticle: "이박삼일 겨울 캠핑 왔습니당! 난로에 등유 꽉꽉 채워왔는데 살만해요", userTitle: "난로없으면 입돌아가요..."),
        UserArticle(userImage: "2", userName: "CampingUser4", userArticle: "영하 14도 실화인가요? 핫팩 마니 가져왔는데 언제 내가 이걸 다 썼지...", userTitle: "핫팩 가져왔는데 다 어디갔냐"),
    ]
    
    var body: some View {
        
        ForEach (articles, id: \.self) { article in
            ListCell(articles: article)
                .listRowSeparator(.hidden)
                .padding(.bottom, -10)
                .listRowBackground(Color("lightGray"))

        }
        .padding(.bottom, 5)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}

