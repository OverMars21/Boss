//
//  PLJobView.swift
//  Boss
//
//  Created by Hao Zhang on 11/23/24.
//

import SwiftUI

struct PLJobView: View {
   
    var job :NewJob
    
    @Environment(HUD.self) var hud
   @Environment(PLJobViewModel.self) var vm
   @State var showActiveDialog = false
   @State var showRemoveDialog = false
   @State var showRemoveAlert = false
  
    @Binding var naviPath: NavigationPath
    


   var isActive: Bool { vm.job.isActive }
   var titleAD: String { isActive ? "" : "[Offline]" }
    
    

    
   var body: some View {
      List {
         VStack(alignment: .leading, spacing: kStackSpacing) {
            //first layor
            HStack {
               VStack(alignment: .leading) {
                  HStack {
                     Text(job.business ?? "").labelBG2()
                      if job.updatedAt?.daysFromNow  ?? Date().daysFromNow <= 7 { Text("NEW").labelWA() }
                  }
                  Text(job.title ?? "" + titleAD).size18b().tc()
               }
               Spacer()
               Text("$\(job.hourlyWage)").accent().headline()
            }.padding(.bottom,-2)
            //second layor
            HStack {
               Text(job.placeName ?? "")
               if job.tax == "NO TAX" { Text(job.tax ?? "").accentBorder() } else if job.tax == "TAX" {
                  Text(job.tax ?? "").redBorder()
               }
                
                if let time = job.updatedAt{
                    Text("\(String(describing: time.toStr))Post").secondary()
                }
             
    
            }
            //third layor
            HStack(spacing: kStackSpacing) {
               HStack(spacing: kIconSpacing) {
                  Image("station").iconStyle()
 //                 Text("\(job.province)-\(job.city)").semib()
                   Text("\(job.province ?? "")-\(job.city ??  "")").semib()
               }
               HStack(spacing: kIconSpacing) {
                  Image("want").iconStyle()
                  Text("Hire \(job.wantNum) People")
               }
               HStack {

               }
            }
         }.textStyle2().cellStyle()
         
         
         //Work detail
         VStack(alignment: .leading, spacing: kStackSpacing) {
            //working hours
            VStack(alignment: .leading, spacing: kStackSpacingS) {
               HStack(spacing: kIconSpacing) {
                  Image("time").iconStyle()
                  Text("Working time").subTStyle()
               }
               HStack(spacing: 2) {
                  Text("\(job.startHour)"); Text(":").colonStyle(); Text(job.startMin == 0 ? "00" : "\(job.startMin)")
                  Text("-")
                  Text("\(job.endHour)"); Text(":").colonStyle(); Text(job.endMin == 0 ? "00" : "\(job.endMin)")
               }
               if job.has2 {
                  HStack(spacing: 2) {
                     Text("\(job.startHour2)"); Text(":").colonStyle(); Text(job.startMin2 == 0 ? "00" : "\(job.startMin2)")
                     Text("-")
                     Text("\(job.endHour2)"); Text(":").colonStyle(); Text(job.endMin2 == 0 ? "00" : "\(job.endMin2)")
                  }
               }
               if job.otherTime?.isEmpty == nil { Text(job.otherTime ?? "").allowMulti() }
            }
            
            exDivider()
            
            if job.workContent?.isEmpty == nil {
               //Job description
               VStack(alignment: .leading, spacing: kStackSpacingS) {
                  HStack(spacing: kIconSpacing) {
                     Image("content").iconStyle()
                     Text("Job description").subTStyle()
                  }
                  Text(job.workContent ?? "").allowMulti()
               }
               exDivider()
            }
            
            //Job requirements
            VStack(alignment: .leading, spacing: kStackSpacingS) {
               HStack(spacing: kIconSpacing) {
                  Image("need").iconStyle()
                  Text("Job requirements").subTStyle()
               }
               HStack {
                  Text(job.needExp ?? "").labelWAL()
                  Text(job.needEdu ?? "").labelWAL()
               }

               if job.otherNeed?.isEmpty == nil { Text(job.otherNeed ?? "").allowMulti() }
            }
            
            exDivider()
            
            //Company Benefits
            VStack(alignment: .leading, spacing: kStackSpacingS) {
               HStack(spacing: kIconSpacing) {
                  Image("benefit").iconStyle()
                  Text("Company Benefits").subTStyle()
               }
               HStack {
                  if job.moveFee { Text("Transportation subsidy").labelWAL() }
                  if job.noOvertime { Text("No Overtime").labelWAL() }
               }
               if job.otherBenefit?.isEmpty == nil { Text(job.otherBenefit ?? "").allowMulti() }
            }
         }.textStyle2().cellStyle()
         
         //Contact Info
         VStack(alignment: .leading, spacing: kStackSpacingS) {
            Text("Contact Info（\(job.contactType ?? "")）").subTStyleL()
            HStack {
               Text(job.contact ?? "").size20b().tc().allowMulti()
               Spacer()
               Button("Copy") {
                  UIPasteboard.general.string = job.contact
                  hud.show("Copied")
               }.btnStyle().padding(6)
            }
         }.cellStyle()
         
         listBottomEView()
      }.listStyle().navigationTitle("Part time Job").navigationBarTitleDisplayMode(.inline)
  

       
   }
}

//#Preview {
//   PLJobView(naviPath: .constant(NavigationPath()))
//}
