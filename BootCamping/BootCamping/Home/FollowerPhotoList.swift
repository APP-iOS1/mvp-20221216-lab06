//
//  FollowerPhotoList.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/19.
//

import SwiftUI

struct FollowerPhotoList: View {
    
    @State var articles = [
        UserArticle(userImage: "photoCard1", userName: "CampingUser1", userHashtag: "#불멍 #추워", userTitle: "어제 오랜만에 불멍했는데 재밌었어요!"),
        UserArticle(userImage: "photoCard2", userName: "CampingUser2", userHashtag: "#동계캠핑 #개추워", userTitle: "추워어으어어ㅏ어 얼어죽겠네"),
        UserArticle(userImage: "photoCard3", userName: "CampingUser3", userHashtag: "#일몰 #오션뷰캠핑장", userTitle: "일몰 예쁜 캠핑장 정보 드려요📌"),
        UserArticle(userImage: "3", userName: "CampingUser3", userHashtag: "#술안주 #곱창 #JMT", userTitle: "날 추우니까 술이 안취해☺️"),
        UserArticle(userImage: "1", userName: "CampingUser4", userHashtag: "#겨울 #이박삼일 #난로필수", userTitle: "난로없으면 입돌아가요..."),
        UserArticle(userImage: "2", userName: "CampingUser4", userHashtag: "#눈멍 #영하14도 #핫팩부족", userTitle: "핫팩 가져왔는데 다 어디갔냐 언제 내가 이걸 다 썼지..."),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach (articles, id: \.self) { article in
                    ListCell(articles: article)
                        
                        .listRowSeparator(.hidden)
                        .padding(.bottom, -10)
                        .listRowBackground(Color.gray)
                }
            }

            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
            
            
        }
    }
}

struct UserArticle: Hashable {
    var id = UUID()
    var userImage: String
    var userName: String
    var userHashtag: String
    var userTitle: String
}

struct ListCell: View {
    var articles: UserArticle
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.white)

                .frame(width: 393, height: 170)
            
            HStack {
                Image(articles.userImage)
                    .resizable()
                    .frame(width: 170, height: 170)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text(articles.userHashtag)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(articles.userTitle)
                        .font(.subheadline)
                    
                    HStack {
                        Image("thekoon_")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .cornerRadius(50)
                        Text(articles.userName)
                            .font(.footnote)
                    }
                }
                .padding(.leading, 5)
            }
        }
        
    }
    
}


struct FollowerPhotoList_Previews: PreviewProvider {
    static var previews: some View {
        FollowerPhotoList()
    }
}
