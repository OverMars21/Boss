//
//  PostJobView.swift
//  Boss
//
//  Created by Hao Zhang on 11/30/24.
//

import SwiftUI

struct PostJobView: View {
   @State var naviPath = NavigationPath()
   var body: some View {
      NavigationStack(path: $naviPath) {
         PostPLJobView(naviPath: $naviPath)
      }
   }
}

#Preview {
   PostJobView()
}
