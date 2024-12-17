//
//  PLJobsView.swift
//  Boss
//
//  Created by Hao Zhang on 11/23/24.
//

import SwiftUI

struct PLJobsView: View {
   @Environment(PLJobViewModel.self) var vm
   @State var naviPath = NavigationPath()
    
    @Environment(\.managedObjectContext)
    var moc

    @FetchRequest(sortDescriptors:[SortDescriptor(\.updatedAt)])
    var newjobs :FetchedResults<NewJob>

    
   @Environment(\.dismiss)
   var dismiss
    
    @State var editjob = NewJob()
   var body: some View {
       
      NavigationStack(path: $naviPath) {
      
          List {
             
             ForEach(newjobs){ newjob in
               
                 NavigationLink{
                     PLJobView(job: newjob,naviPath:$naviPath)
                } label: {
                    PLJobCellView(job: newjob)
                 }.buttonStyle(.borderless)
             
             }.onDelete(perform: deleteJob)
              .listRowStyle()
             
         }.listStyle()
          
          
      }
   }
    
    
    func deleteJob(at offsets:IndexSet){
        for offset in offsets
        {
            let deletejob = newjobs[offset]
            moc.delete(deletejob)
        }
        
        try? moc.save()
        dismiss()
        
    }
    
}

#Preview {
   PLJobsView().environment(PLJobViewModel())
}
