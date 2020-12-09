//
//  ContentView.swift
//  Moonshot
//
//  Created by Adam Nguyen on 9/26/20.
//

import SwiftUI


struct ContentView: View {
    let astronauts: [Astronauts] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                
                VStack (alignment: .leading) {
                    Text(mission.displayName)
                        .font(.headline)
                    Text(mission.formattedLaunchDate)
                }
            }
        }
        .navigationBarTitle("Moonshot")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
