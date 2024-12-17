//
//  PostPLJobView.swift
//  Boss
//
//  Created by Hao Zhang on 11/30/24.
//

import SwiftUI

struct PostPLJobView: View {
    
    @Environment(\.managedObjectContext)
    var moc

    @FetchRequest(sortDescriptors:[])
    var newjobs :FetchedResults<NewJob>

   @Environment(\.dismiss)
  var dismiss
    
   var isEditing = false
   @AppStorage("workPlaceName") var workPlaceName = ""
   @AppStorage("workProvince") var workProvince = ""
   @AppStorage("workCity") var workCity = ""
   @AppStorage("workContact") var workContact = ""
   @Environment(PLJobViewModel.self) var vm
   @Environment(HUD.self) var hud
   @Environment(TabBarViewModel.self) var tabbarVM
   @Binding var naviPath: NavigationPath
   var draftJob: PLJob { vm.draftJob }
   var invalidMsg: String? {
      if draftJob.title.isBlank { return "The job title is empty." }
      if draftJob.hourlyWage < 10 || draftJob.hourlyWage > 1000 { return "The base hourly wage is too low or too high" }
      if draftJob.placeName.isBlank { return "The work location is empty" }
      if draftJob.city.isBlank  { return "The work location city is empty" }
      if draftJob.contact.isBlank  { return "The application method is empty." }
      if draftJob.title.count > 50 { return "The job title cannot exceed 50 characters" }
      if draftJob.otherTime.count > 100 { return "The time description cannot exceed 100 characters" }
      if draftJob.otherNeed.count > 300 { return "The job requirements cannot exceed 300 characters" }
      if draftJob.workContent.count > 500 { return "The job description cannot exceed 500 characters" }
      if draftJob.otherBenefit.count > 300 { return "The job benefits cannot exceed 300 characters" }
      if draftJob.placeName.count > 50 { return "The work location cannot exceed 50 characters" }
      if draftJob.city.count > 20 { return "The work location city cannot exceed 20 characters" }
      if draftJob.contact.count > 200 { return "The contact info cannot exceed 200 characters" }
      return nil
   }
   
   var body: some View {
      @Bindable var vm = vm
      ScrollView(showsIndicators: false) {
         VStack(spacing: kStackSpacingS) {
            // basic info
            VStack(alignment: .leading, spacing: kStackSpacing) {
               HStack {
                  VStack(alignment: .leading) {
                     Text("Job Type").littleTStyle()
                     Picker("Job Type", selection: $vm.draftJob.business) {
                        ForEach(kBusinessArr, id: \.self) { Text($0) }
                     }.pStyle()
                  }
                  VStack(alignment: .leading) {
                     Text("Job name").littleTStyle()
                     TextField("iOS Development", text: $vm.draftJob.title).tfStyle()
                  }
               }
               VStack(alignment: .leading) {
                  Text("Whether to file tax return").littleTStyle()
                  Picker("Whether to file tax return", selection: $vm.draftJob.tax) {
                     ForEach(kTaxArr, id: \.self) { Text($0) }
                  }.pickerStyle(.segmented)
               }.padding(.bottom,5)
               HStack {
                  Text("Hourly Wage：").littleTStyle()
                  TextField("", value: $vm.draftJob.hourlyWage, formatter: NumberFormatter())
                     .size18ab().multilineTextAlignment(.center).kerning(2)
                     .keyboardType(.numberPad).tfStyle().frame(width: 88)
                  Text("Please fill in the minimum hourly wage").size13s()
               }
               HStack {
                  Text("Number of hires：").littleTStyle()
                  Picker("Number of hires：", selection: $vm.draftJob.wantNum) {
                     ForEach(kWantNumArr, id: \.self) { Text("\($0) People") }
                  }.pStyle()
                  Text("Please specify the maximum number of hires").size13s()
               }
               
            }.padding().bg()
            // work time
            VStack(alignment: .leading, spacing: kStackSpacingS) {
               Text("Working hours").littleTStyle()
               HStack {
                  HStack(spacing: 3) {
                     Picker("Start Hour", selection: $vm.draftJob.startHour) {ForEach(0..<25) { Text("\($0)") }}.pStyle()
                     Text(":").colonStyle()
                     Picker("Start Minute", selection: $vm.draftJob.startMin) {
                        ForEach([0,30], id: \.self) { Text($0 == 0 ? "00" : "\($0)") }
                     }.pStyle()
                     Image(systemName: "minus")
                     Picker("End Hour", selection: $vm.draftJob.endHour) {ForEach(0..<25) { Text("\($0)") }}.pStyle()
                     Text(":").colonStyle()
                     Picker("End Minute", selection: $vm.draftJob.endMin) {
                        ForEach([0,30], id: \.self) { Text($0 == 0 ? "00" : "\($0)") }
                     }.pStyle()
                  }
                  Button {
                     withAnimation { vm.draftJob.has2.toggle() }
                  } label: {
                     Image(systemName: vm.draftJob.has2 ? "minus.circle.fill" : "plus.circle.fill")
                        .foregroundStyle(vm.draftJob.has2 ? .red : .accent)
                  }.font(.title2).padding(.horizontal,3)
               }
               
               if vm.draftJob.has2 {
                  HStack(spacing: 3) {
                     Picker("Start Hour2", selection: $vm.draftJob.startHour2) {ForEach(0..<25) { Text("\($0)") }}.pStyle()
                     Text(":").colonStyle()
                     Picker("Start Minute2", selection: $vm.draftJob.startMin2) {
                        ForEach([0,30], id: \.self) { Text($0 == 0 ? "00" : "\($0)") }
                     }.pStyle()
                     Image(systemName: "minus")
                     Picker("End Hour2", selection: $vm.draftJob.endHour2) {ForEach(0..<25) { Text("\($0)") }}.pStyle()
                     Text(":").colonStyle()
                     Picker("End Minute2", selection: $vm.draftJob.endMin2) {
                        ForEach([0,30], id: \.self) { Text($0 == 0 ? "00" : "\($0)") }
                     }.pStyle()
                  }
               }
               
               Text("Additional information").littleTStyle()
               TextField("Specific working hours available for discussion", text: $vm.draftJob.otherTime, axis: .vertical)
                  .tfStyleMultiS()

            }.push(to: .leading).padding().bg()
            
             // Job requirement
            VStack(alignment: .leading, spacing: kStackSpacing) {
               HStack {
                  VStack(alignment: .leading) {
                     Text("Experience").littleTStyle()
                     Picker("Experience", selection: $vm.draftJob.needExp) {ForEach(kExpArr, id: \.self) { Text($0) }}.pStyle()
                  }
                  VStack(alignment: .leading) {
                     Text("Educational background").littleTStyle()
                     Picker("Educational background", selection: $vm.draftJob.needEdu) {ForEach(kEduArr, id: \.self) { Text($0) }}.pStyle()
                  }
               }
   
                
               VStack(alignment: .leading) {
                  Text("Additional requirements (optional)").littleTStyle()
                  TextField("", text: $vm.draftJob.otherNeed, axis: .vertical).tfStyleMultiM()
               }
            }.padding().bg()
            //Job Description
            VStack(alignment: .leading) {
               Text("Job Description (Optional)").littleTStyle()
               TextField("", text: $vm.draftJob.workContent, axis: .vertical).tfStyleMultiM()
            }.padding().bg()
            //Employee Benefits
            VStack(alignment: .leading, spacing: kStackSpacing) {
               Text("Employee Benefits").littleTStyle()
               HStack {
                  Text("Commute Subsidy").onTapGesture {vm.draftJob.moveFee.toggle()}.toggleStyle(isTap: vm.draftJob.moveFee)
                  Text("No Overtime").onTapGesture {vm.draftJob.noOvertime.toggle()}.toggleStyle(isTap: vm.draftJob.noOvertime)
               }
               VStack(alignment: .leading) {
                  Text("Additional Benefits (Optional)").littleTStyle()
                  TextField("", text: $vm.draftJob.otherBenefit, axis: .vertical).tfStyleMultiM()
               }
            }.padding().bg()
            //Work Location
            VStack(alignment: .leading, spacing: kStackSpacing) {
               VStack(alignment: .leading) {
                  Text("Workplace Name").littleTStyle()
                  TextField("", text: $vm.draftJob.placeName).tfStyle()
               }
               HStack {
                  Text("State：").littleTStyle()
                  Picker("State", selection: $vm.draftJob.province) {
                     ForEach(kProvinceArr, id: \.self) { Text($0) }
                  }.pStyle()

               }
               HStack {
                  Text("City：").littleTStyle()
                  TextField("", text: $vm.draftJob.city).tfStyle().frame(width: 115)
                   
               }
            }.padding().bg()
            //Contact Info
            VStack(alignment: .leading, spacing: kStackSpacingS) {
               Text("Contact Info").littleTStyle()
               HStack {
                  Picker("Contact Info Type", selection: $vm.draftJob.contactType) {
                     ForEach(kContactTypeArr, id: \.self) { Text($0) }
                  }.pStyle()
                  TextField("123-456-7890", text: $vm.draftJob.contact).tfStyle()
               }
               }
            }.padding().bg()
            //submit
            Button {
               postJob()
            } label: {
               Text("Submit").appleStyle()
            }.padding().bg()

            
            
            
         }.tc().bg2()

      }
   }
   


#Preview {
   PostPLJobView(naviPath: .constant(NavigationPath()))
}
