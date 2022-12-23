//
//  AddChoiceView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/24.
//

import SwiftUI

struct AddChoiceView: View {
    @State var addCategory: String = ""
    @State var isPresented: Bool = false
    @Binding var tabSelection: Int
    @StateObject var photoPostStore: PhotoPostStore
    @StateObject var communityPostStore: CommunityPostStore
    
    var body: some View {
        VStack {
                Text("")
                    .sheet(isPresented: $isPresented) {
                        CategoryModalView(addCategory: $addCategory, isPresented: $isPresented)
                            .presentationDetents([.fraction(0.25)])
                    }
                if addCategory == "photo" {
                    AddView(photoPostStore: photoPostStore, tabSelection: $tabSelection)
                } else if addCategory == "community" {
                    AddCommunityView(communityPostStore: communityPostStore)
                }
        }

        .onAppear {
            isPresented = true
        }
    }
}

struct CategoryModalView: View {
    @Binding var addCategory: String
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            List {
                Button {
                    addCategory = "photo"
                    isPresented = false
                } label: {
                    Text("Photo 쓰러가기")
                }
                
                Button {
                    addCategory = "community"
                    isPresented = false
                } label: {
                    Text("Community 쓰러가기")
                }
                
            }
        }
    }
}

struct AddChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        AddChoiceView(tabSelection: .constant(3), photoPostStore: PhotoPostStore(), communityPostStore: CommunityPostStore())
    }
}
