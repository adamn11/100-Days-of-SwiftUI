//
//  ContentView.swift
//  HabitTrackingApp
//
//  Created by Adam Nguyen on 10/31/20.
//

import SwiftUI


class ActivityList: ObservableObject {
    @Published var activities: [Activity] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "ActivityList")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "ActivityList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.activities = decoded
                return
            }
        }
        
        self.activities = []
    }
}

struct Activity: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    var count = 1
}

struct ContentView: View {
    @ObservedObject var activityList = ActivityList()
    @State private var showAddActivityPage = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activityList.activities) { item in
                    NavigationLink(destination: ActivityDetailView(activity: item)) {
                        Text(item.name)
                    }
                }
                .onDelete(perform: removeActivity)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showAddActivityPage = true
                }) {
                    Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showAddActivityPage) {
            AddActivity(activities: self.activityList)
        }
    }
    
    func removeActivity(at offsets: IndexSet) {
        activityList.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
