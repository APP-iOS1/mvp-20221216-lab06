//
//  ArticleDetailView.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/20.
//

import SwiftUI
import Foundation

struct ArticleDetailView: View {
    
    @State private var isGood: Bool = false
    @State private var favoriteMark: Bool = false
    
    @State private var commentText: String = ""
    var listStruct: ListStruct
    // 작성시간
    //        var createdDate: String {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.locale = Locale(identifier: "ko_kr")
    //        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
    //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    //        let dateCreatedAt = Date()
    //        return dateFormatter.string(from: dateCreatedAt)

    var body: some View {
        // 해시태그, 타이틀, 작성날짜
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("#불멍 #추워 #더포레")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("짱 재밌는 당일 불멍치기. 경기도 광주 카페 더 포레")
                        .font(.headline)
                        .kerning(-1)
                    Text("2022년 12월 20일") // 작성시간
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                }
                .padding(.vertical, 2)
                
                Image("5")
                    .resizable()
                    .frame(width: 360, height: 360)
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 5)
                
                // 본문내용, 위치, 예약버튼
                Group {
                    Text("경기도 광주에 위치한 대형 카페 더포레를 다녀왔다.  불멍했는데 짱 조앗다. 붕어빵 틀 가져갈걸..  오로라불멍도 가져갓는데 생각보다 별루였다.가격은 2시간 반 이용에 기본 자리값 2만5천원. 잡다한거 추가하니 7만 오천원이였다. 행복했당. ")
                        .kerning(-0.5)
                        .lineSpacing(5)
                        .font(.callout)
                        .padding(.bottom,20)
                        .padding(.horizontal, 7)
                    
                    HStack {
                        Text("위치 | 카페 더 포레")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button {
                        } label: {
                            Text("예약하기 >")
                                .font(.footnote)
                                .padding(.leading, 10)
                        }
                        
                    }
                    
                    // 작성자 계정 & 팔로우
                    HStack {
                        Button {
                        } label: {
                            Image("thekoon_")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .cornerRadius(50)
                            Text("thekoon_")
                        }
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.brown)
                                    .frame(width: 80, height: 30)
                                Text("팔로우")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.vertical)
                }
                
                Divider()
                
                // 좋아요, 댓글, 북마크
                HStack {
                    Button {
                        isGood.toggle()
                    } label: {
                        Image(systemName: isGood ? "heart.fill" : "heart")
                        Text("3") // 좋아요 카운트
                    }
                    Image(systemName: "ellipsis.message")
                        .padding(.leading, 10)
                    Text("3") // 댓글 개수
                    
                    Spacer()
                    // 게시글 북마크
                    Button {
                        favoriteMark.toggle()
                    } label: {
                        Image(systemName: favoriteMark ? "bookmark.fill" : "bookmark")
                    }
                }
                .padding(8)
                
                Divider()
                
                // 댓글
                Comments()
            }
            .padding()
            
            // 댓글 더보기 버튼
            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.brown)
                        .frame(width: 80, height: 30)
                    Text("더보기..")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }
            
            HStack {
                Image("thekoon_")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .cornerRadius(50)
                
                TextField("댓글을 남겨보세요!", text: $commentText)
                    .textFieldStyle(OvalTextFieldStyle())
                    .font(.subheadline)
                    .frame(width: 270, height: 40)

                Button {
                    commentText = ""
                } label: {
                    Image(systemName: "arrow.forward.circle.fill")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

// 댓글

struct Comments: View {
    var body: some View {
        // ScrollView(.vertical) {
        VStack(alignment: .leading) {
            Text("댓글")
                .font(.headline)
                .padding(10)
            
            HStack {
                Image("thekoon_")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .cornerRadius(50)
                Text("CampingUser1")
                    .font(.subheadline)
            }
            .padding(.bottom, -5)
            VStack(alignment: .leading) {
                Text("재밌으셨나요ㅠㅠ 저도 가고싶어여... 다음주에 가는데 너무 시간이 많이 남아서 킹받는다!!!! 시간이 안가요 ㅠㅠㅠㅠㅠ")
                    .font(.subheadline)
                    .kerning(-0.5)
                    .padding(.bottom, 1)
                
                Text("2022-12-20")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(width: 80)
                
            }
            .padding(.leading, 40)
        }
        // .frame(width: 350, alignment: .leading)
        //                    .rotationEffect(Angle(degrees: 180))
        //  }
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.gray)
            .cornerRadius(20)

    }
}



struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(listStruct: ListStore().listData.first!)
    }
}
