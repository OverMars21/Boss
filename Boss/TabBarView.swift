//
//  TabBarView.swift
//  Boss
//
//  Created by Hao Zhang on 12/1/24.
//

import SwiftUI

struct TabBarView: View {
   @Environment(TabBarViewModel.self) var vm
   var body: some View {
      @Bindable var vm = vm
      TabView(selection: $vm.selectedTab) {
         Tab("Work", systemImage: "dollarsign.ring", value: "job") {
            PLJobsView().toolbarBackground(.visible, for: .tabBar)
         }
         Tab("Hire", systemImage: "plus.circle", value: "postJob") {
            PostJobView().toolbarBackground(.visible, for: .tabBar)
         }
      }
   }
}

#Preview {
   TabBarView()
}
