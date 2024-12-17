//
//  DataController.swift
//  Boss
//
//  Created by Hao Zhang on 12/14/24.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    let container = NSPersistentContainer(name:"DataModel")
    
    init(){
        container.loadPersistentStores{ descreption,error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
