//
//  ActivityView.swift
//  HabitTrackingApp
//
//  Created by Adam Nguyen on 11/1/20.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activity: Activity
    
    var body: some View {
        NavigationView {
            Form {cnn.com
                Text(activity.description)
            }
            .navigationBarTitle(activity.name)
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activity: Activity(name: "Reading", description: "Read a book"))
    }
}
