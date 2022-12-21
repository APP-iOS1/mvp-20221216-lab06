//
//  BootCampingApp.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/12/16.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct BootCampingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some Scene {
        WindowGroup {
            LoginView(isFirstLaunching: $isFirstLaunching)
                    .environmentObject(AuthStore())
                    .environmentObject(PlaceStore())
            }
    }
}
