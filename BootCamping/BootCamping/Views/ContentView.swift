//
//  ContentView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authStore: AuthStore
    
    var body: some View {
        
        if authStore.currentUser != nil {
            BootcampingTabView()
                .environmentObject(PlaceStore())
                .environmentObject(PhotoPostStore())
                .onAppear {
                    authStore.fetchUserList()
                }
        } else {
            LoginView(isPresented: .constant(false))
                .onAppear {
                    authStore.fetchUserList()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthStore())
    }
}
