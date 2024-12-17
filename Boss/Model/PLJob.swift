//
//  PLJob.swift
//  Boss
//
//  Created by Hao Zhang on 11/30/24.
//

import Foundation

struct PLJob: Identifiable {
   var id = UUID().uuidString 
   var isActive = true
   var title = "IOS Development"
   var business = "IT"
   var tax = "Tax"
   var hourlyWage = 100
   var wantNum = 3
   var contactType = "Phone number"
   var contact = ""
   //work time and place
   var startHour = 10
   var startMin = 0
   var endHour = 12
   var endMin = 0
   var has2 = false
   var startHour2 = 10
   var startMin2 = 0
   var endHour2 = 20
   var endMin2 = 0
   var otherTime = ""
   var placeName = ""
   var province = "CA"
   var city = ""
   var workContent = ""
   //requirement
   var needExp = "1-3 years"
   var needEdu = "undergraduate"
   var needLan = "Swift"
   var needFrame = "SwiftUI"
   var otherNeed = ""
   //benfits
   var moveFee = true
   var noOvertime = true
   var otherBenefit = ""
   //others
   var companyName = ""
   var userID = ""
   var updatedAt = Date()
   
   static let job = PLJob(title: "iOS Development", tax: "TAX", contact: "123456789", has2: true, startHour2: 14, endHour2: 22, otherTime: "can be adjusted", placeName: "Apple", province: "CA", city: "San Jose", workContent: "iOS development is a great way to learn and grow your skills. It's also a great way to earn money.", otherNeed: "1-3 years development experiment", otherBenefit: "Free apples everyday",companyName:"Apple")
}
