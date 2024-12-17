//
//  PostPLJobView+.swift
//  Boss
//
//  Created by Hao Zhang on 11/30/24.
//

import SwiftUI

extension PostPLJobView {
   func postJob() {
      if let invalidMsg {
         hud.show(invalidMsg)
         return
      }
      
       
       workPlaceName = draftJob.placeName
       workProvince = draftJob.province
       workCity = draftJob.city
       workContact = draftJob.contact
       
       vm.draftJob.companyName = "Apple"
       
       vm.postJob()
       
       let newJob = NewJob(context: moc)
       newJob.id = UUID()
       newJob.title = draftJob.title
       newJob.isActive = draftJob.isActive
       newJob.business = draftJob.business
       newJob.tax = draftJob.tax
       
       newJob.hourlyWage = Int16(draftJob.hourlyWage)
       newJob.wantNum = Int16(draftJob.wantNum)
       newJob.contactType = draftJob.contactType
       newJob.contact = draftJob.contact
       newJob.startHour = Int16(draftJob.startHour)
       newJob.startMin = Int16(draftJob.startMin)
       newJob.endHour = Int16(draftJob.endHour)
       newJob.endMin = Int16(draftJob.endMin)
       
       newJob.has2 = draftJob.has2
       newJob.startHour2 = Int16(draftJob.startHour2)
       newJob.startMin2 = Int16(draftJob.startMin2)
       newJob.endHour2 = Int16(draftJob.endHour2)
       newJob.endMin2 = Int16(draftJob.endMin2)
       
       newJob.otherTime = draftJob.otherTime
       newJob.placeName = draftJob.placeName
       newJob.province = draftJob.province
       newJob.city = draftJob.city
       newJob.workContent = draftJob.workContent
       
       newJob.needExp = draftJob.needExp
       newJob.needEdu = draftJob.needEdu
       newJob.needLan = draftJob.needLan
       newJob.needFrame = draftJob.needFrame
       newJob.otherNeed = draftJob.otherNeed
       
       newJob.moveFee = draftJob.moveFee
       newJob.noOvertime = draftJob.noOvertime
       newJob.otherBenefit = draftJob.otherBenefit
       newJob.companyName = draftJob.companyName
       newJob.userID = draftJob.userID
       
       newJob.updatedAt = draftJob.updatedAt
       
       
       try? moc.save()
       dismiss()
       
       
       
       
       
      workPlaceName = draftJob.placeName
      workProvince = draftJob.province
      workCity = draftJob.city
      workContact = draftJob.contact
      
      vm.draftJob.companyName = "Apple"
      
      vm.postJob()
      
      if isEditing {
         hud.show("Modified Successful")
         if !naviPath.isEmpty { naviPath.removeLast() }
      } else {
         hud.show("Published Successful")
         vm.jobs.append(vm.job)
         tabbarVM.selectedTab = "job"
      }
      
      vm.draftJob = PLJob()
   }
}
