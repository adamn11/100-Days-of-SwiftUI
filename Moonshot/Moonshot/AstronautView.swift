//
//  AstronautView.swift
//  Moonshot
//
//  Created by Adam Nguyen on 9/27/20.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronauts
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [Astronauts] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        let astronautMissions: [Mission] = missions.filter { mission in
                    mission.crew.contains(where: { $0.name == self.astronaut.id })
                }
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions")
                        .font(.headline)
                    
                    ForEach(self.astronautMissions, id: \.displayName) { mission in
                        NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                Text(mission.displayName)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronauts] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
