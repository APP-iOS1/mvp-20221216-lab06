//
//  ContentView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/16.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @StateObject var photoPostStore: PhotoPostStore = PhotoPostStore()
    
    
    var body: some View {
        List {
            ForEach(photoPostStore.photoPost, id: \.id) { post in
                Text("\(post.title)")
            }
        }
        .navigationTitle("List")
        .toolbar {
            NavigationLink {
                WriteView(photoPostStore: photoPostStore)
            } label: {
                Text("Add")
            }
        }
        .onAppear {
            print(Auth.auth().currentUser?.uid)
            
            photoPostStore.fetchPhotoPost()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
