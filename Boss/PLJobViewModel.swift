//
//  PLJobViewModel.swift
//  Boss
//
//  Created by Hao Zhang on 12/1/24.
//

import Foundation

@Observable final class PLJobViewModel {
   var job = PLJob()
   var draftJob = PLJob()
   var jobs: [PLJob] = [.job]
   
   func postJob() {
      job = draftJob


      job.title = job.title.trimmed
      job.placeName = job.placeName.trimmed
      job.province = job.province.trimmed
      job.city = job.city.trimmed

       if job.otherTime.isBlank { job.otherTime = "" } else { job.otherTime = job.otherTime.trimmed }
      if job.otherNeed.isBlank { job.otherNeed = "" } else { job.otherNeed = job.otherNeed.trimmed }
      if job.workContent.isBlank { job.workContent = "" } else { job.workContent = job.workContent.trimmed }
      if job.otherBenefit.isBlank { job.otherBenefit = "" } else { job.otherBenefit = job.otherBenefit.trimmed }

      

      
      
   }
   
   func toggleJobStatus() {
      job.isActive.toggle()
   }
   func removeJob() {
      
   }
}
