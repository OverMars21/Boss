//
//  BossApp.swift
//  Boss
//
//  Created by Hao Zhang on 11/21/24.
//

import SwiftUI

@main
struct BossApp: App {

    @StateObject private var dataController = DataController()
    
    
   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   @State var hud = HUD()
   @State var tabbarVM = TabBarViewModel()
   @State var plJobVM = PLJobViewModel()
   var body: some Scene {
      WindowGroup {
         TabBarView()
            .hud(isPresented: $hud.isPresented) { Text(hud.title) }
            .environment(hud).environment(tabbarVM)
            .environment(plJobVM)
            .environment(\.managedObjectContext,dataController.container.viewContext)

      }
   }
}

@MainActor class AppDelegate: NSObject, UIApplicationDelegate {
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
      UISegmentedControl.appearance().selectedSegmentTintColor = .accent
      UISegmentedControl.appearance().setTitleTextAttributes([
         .font: UIFont.systemFont(ofSize: 17,weight: .medium),
         .foregroundColor: UIColor(Color.aTC)
      ], for: .normal)
      UISegmentedControl.appearance().setTitleTextAttributes([
         .font: UIFont.systemFont(ofSize: 17,weight: .semibold),
         .foregroundColor: UIColor(Color.white)
      ], for: .selected)
      
      return true
   }
}

