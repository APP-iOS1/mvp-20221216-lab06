//
//  ListStruct.swift
//  BootCamping
//
//  Created by 이소영 on 2022/12/21.
//

import Foundation
import SwiftUI

struct ListStruct: Identifiable, Hashable {
    var id = UUID()
    var image: [UserImage]
    var date: String
    var name: String
    var likes: Int
    var comment: [CommentStruct]
    var location: String
    
    var userName: String
    var userImage: String
    
    var title: String
    var content: String
}

struct CommentStruct: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var content: String
}

struct UserImage: Identifiable, Hashable {
    var id = UUID()
    var imageNmae: String
    var image: Image {
        return Image(imageNmae)
    }
}
class ListStore: ObservableObject {
    @Published var listData: [ListSturct] = [
        ListSturct(image: [UserImage(imageNmae: "photoCard1"), UserImage(imageNmae: "3"), UserImage(imageNmae: "4")], date: "2022년 11월 10일", name: "북분솔밭캠핑장", likes: 0, comment: [CommentStruct(name: "bestagrammm", content: "너무너무 이뻐요")], location: "서울", userName: "_chasomin", userImage: "_chasomin", title: "여자친구와 주말 힐링 캠핑", content: "저번주 저는 여름 휴가로 숲속으로 둘러쌓인 캠핑장을 다녀왔어요! 산속에 갇혀서 자연과 함께 캠핑하는 기분도 너무 좋고 산을 바라보며 하루종일 산멍을 왔더니 정말 힐링되더라구요! 가까운 도심 캠핑장도 좋지만 역시 캠핑은 나무와 숲으로 둘러쌓인 곳으로 가야 기분도 좋고 캠핑하는 맛이 나더라구요! 산속의 공기가 가득하게 느껴져서 도심속에서 찌들어있던 피로감을 날릴 수 있었어요! 캠핑장 사이트 옆에는 계곡이 있어서 여름철에는 계곡에서 발에 물을 담그고 시원하게 보내실 수 있습니다. 주변에는 삼탄역이라는 간이역이 있는데 포토존도 있고 도심에선 느끼지 못한 새로운 분위기를 느낄수가 있습니다."),
        ListSturct(image: [UserImage(imageNmae: "photoCard2"), UserImage(imageNmae: "5"), UserImage(imageNmae: "6")], date: "2021년 11월 29일", name: "주전패밀리캠핑장", likes: 0, comment: [CommentStruct(name: "bestagrammm", content: "너무너무 이뻐요")], location: "경기도", userName: "_chasomin", userImage: "_chasomin", title: "캠핑은 즐거워", content: "저번주 저는 여름 휴가로 숲속으로 둘러쌓인 캠핑장을 다녀왔어요! 산속에 갇혀서 자연과 함께 캠핑하는 기분도 너무 좋고 산을 바라보며 하루종일 산멍을 왔더니 정말 힐링되더라구요! 가까운 도심 캠핑장도 좋지만 역시 캠핑은 나무와 숲으로 둘러쌓인 곳으로 가야 기분도 좋고 캠핑하는 맛이 나더라구요! 산속의 공기가 가득하게 느껴져서 도심속에서 찌들어있던 피로감을 날릴 수 있었어요! 캠핑장 사이트 옆에는 계곡이 있어서 여름철에는 계곡에서 발에 물을 담그고 시원하게 보내실 수 있습니다. 주변에는 삼탄역이라는 간이역이 있는데 포토존도 있고 도심에선 느끼지 못한 새로운 분위기를 느낄수가 있습니다."),
        ListSturct(image: [UserImage(imageNmae: "c"), UserImage(imageNmae: "d"), UserImage(imageNmae: "f")], date: "2021년 9월 21일", name: "애플오토캠핑장", likes: 0, comment: [CommentStruct(name: "bestagrammm", content: "너무너무 이뻐요")], location: "제주도", userName: "_chasomin", userImage: "_chasomin", title: "역시 부트캠핑", content: "저번주 저는 여름 휴가로 숲속으로 둘러쌓인 캠핑장을 다녀왔어요! 산속에 갇혀서 자연과 함께 캠핑하는 기분도 너무 좋고 산을 바라보며 하루종일 산멍을 왔더니 정말 힐링되더라구요! 가까운 도심 캠핑장도 좋지만 역시 캠핑은 나무와 숲으로 둘러쌓인 곳으로 가야 기분도 좋고 캠핑하는 맛이 나더라구요! 산속의 공기가 가득하게 느껴져서 도심속에서 찌들어있던 피로감을 날릴 수 있었어요! 캠핑장 사이트 옆에는 계곡이 있어서 여름철에는 계곡에서 발에 물을 담그고 시원하게 보내실 수 있습니다. 주변에는 삼탄역이라는 간이역이 있는데 포토존도 있고 도심에선 느끼지 못한 새로운 분위기를 느낄수가 있습니다."),
        ListSturct(image: [UserImage(imageNmae: "photoCard3"), UserImage(imageNmae: "10"), UserImage(imageNmae: "7")], date: "2021년 3월 11일", name: "주전패밀리캠핑장", likes: 0, comment: [CommentStruct(name: "bestagrammm", content: "너무너무 이뻐요")], location: "제주도", userName: "_chasomin", userImage: "_chasomin", title: "미니랑 캠핑", content: "저번주 저는 여름 휴가로 숲속으로 둘러쌓인 캠핑장을 다녀왔어요! 산속에 갇혀서 자연과 함께 캠핑하는 기분도 너무 좋고 산을 바라보며 하루종일 산멍을 왔더니 정말 힐링되더라구요! 가까운 도심 캠핑장도 좋지만 역시 캠핑은 나무와 숲으로 둘러쌓인 곳으로 가야 기분도 좋고 캠핑하는 맛이 나더라구요! 산속의 공기가 가득하게 느껴져서 도심속에서 찌들어있던 피로감을 날릴 수 있었어요! 캠핑장 사이트 옆에는 계곡이 있어서 여름철에는 계곡에서 발에 물을 담그고 시원하게 보내실 수 있습니다. 주변에는 삼탄역이라는 간이역이 있는데 포토존도 있고 도심에선 느끼지 못한 새로운 분위기를 느낄수가 있습니다."),
        ListSturct(image: [UserImage(imageNmae: "2"), UserImage(imageNmae: "a"), UserImage(imageNmae: "b")], date: "2021년 1월 25일", name: "북분솔밭캠핑장", likes: 0, comment: [CommentStruct(name: "bestagrammm", content: "너무너무 이뻐요")], location: "제주도", userName: "_chasomin", userImage: "_chasomin", title: "첫 캠핑", content: "저번주 저는 여름 휴가로 숲속으로 둘러쌓인 캠핑장을 다녀왔어요! 산속에 갇혀서 자연과 함께 캠핑하는 기분도 너무 좋고 산을 바라보며 하루종일 산멍을 왔더니 정말 힐링되더라구요! 가까운 도심 캠핑장도 좋지만 역시 캠핑은 나무와 숲으로 둘러쌓인 곳으로 가야 기분도 좋고 캠핑하는 맛이 나더라구요! 산속의 공기가 가득하게 느껴져서 도심속에서 찌들어있던 피로감을 날릴 수 있었어요! 캠핑장 사이트 옆에는 계곡이 있어서 여름철에는 계곡에서 발에 물을 담그고 시원하게 보내실 수 있습니다. 주변에는 삼탄역이라는 간이역이 있는데 포토존도 있고 도심에선 느끼지 못한 새로운 분위기를 느낄수가 있습니다."),
    ]
    
    func addList(image: String, date: String, name: String, location: String, userName: String, userImage: String, title: String, content: String) {
        if title != "" && content != "" {
            listData.append(ListSturct(image: [UserImage(imageNmae: image)], date: "2022년 12월 2일", name: name, likes: 0, comment: [], location: location, userName: userName, userImage: userImage, title: title, content: content))
        }
    }
    
}
