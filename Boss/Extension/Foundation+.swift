//
//  Foundation+.swift
//  Boss
//
//  Created by Hao Zhang on 12/1/24.
//

import Foundation

extension String {
   var isBlank: Bool { self.isEmpty || self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
   var trimmed: String { self.trimmingCharacters(in: .whitespacesAndNewlines) }
}

extension Date {
   var daysFromNow: Int {
      Calendar.current.dateComponents([.day], from: self, to: .now).day ?? 0
   }
   
   var toStr: String {
      let year = Calendar.current.component(.year, from: self)
      let currentYear = Calendar.current.component(.year, from: Date()) //2024
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = (year == currentYear) ? "M-d" : "yyyy-M-d"
      return dateFormatter.string(from: self)
   }

}

