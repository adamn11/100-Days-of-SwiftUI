//
//  AddActivity.swift
//  HabitTrackingApp
//
//  Created by Adam Nguyen on 10/31/20.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var activities: ActivityList
    @Environment(\.presentationMode) var presentationMode
    @State private var activityName = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity", text: $activityName)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing:
                Button(action: {
                    let activity = Activity(name: activityName, description: description)
                    self.activities.activities.append(activity)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
            })
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: ActivityList())
    }
}
