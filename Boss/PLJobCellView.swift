//
//  PLJobCellView.swift
//  Boss
//
//  Created by Hao Zhang on 11/21/24.
//

import SwiftUI

struct PLJobCellView: View {
  // let job: PLJob
    
    let job: NewJob
    
   var body: some View {
      VStack(spacing: 8) {
         //first layor
         HStack {
            VStack(alignment: .leading) {
               HStack {
                  Text(job.business ?? "").labelBG2()
                   if job.updatedAt?.daysFromNow ?? Date().daysFromNow <= 7 { Text("NEW").labelWA() }
               }
               HStack {
                  Text(job.title ?? "").tc().headline().oneLineStyle()
                  if job.tax ?? "" == "No TAX" {
                     Text(job.tax ?? "").accentBorder()
                  } else if job.tax == "TAX" {
                     Text(job.tax ?? "").redBorder()
                  }
               }
            }
            Spacer()
            Text("$\(job.hourlyWage)").accent().headline()
         }
         
         //second layor
         OverflowGrid(horizontalSpacing: 5) {
            Text(job.needExp ?? "").labelBG()
            Text(job.needEdu ?? "").labelBG()
            Text("\(job.startHour)-\(job.endHour)").labelBG()
            if job.has2 { Text("\(job.startHour2)-\(job.endHour2)").labelBG() }
            if job.moveFee { Text("Transport Fee").labelPP()  }
            if job.noOvertime { Text("No Overtime").labelPP() }
         }.push(to: .leading)
         
         //third layor
         HStack {
            Text(job.placeName ?? "").tc().lineLimit(1)
            Spacer()
            Text("\(job.province ?? "")-\(job.city ?? "")").accent().semib().oneLineStyle()
         }.size14()
      }.cellPaddingRadius().cellOutPadding()
   }
}

//#Preview {
//   PLJobCellView(job: PLJob.job)
//}
