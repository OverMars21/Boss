//
//  PLJobView+.swift
//  Boss
//
//  Created by Hao Zhang on 12/6/24.
//

import SwiftUI

extension PLJobView {
   func toggleJobStatus() {
      vm.toggleJobStatus()
      hud.show("\(isActive ? "Published Successful" : "Offline Successful")")
   }
   func removeJob() {
      vm.removeJob()
      hud.show("Deleted Successful")

   }
}
