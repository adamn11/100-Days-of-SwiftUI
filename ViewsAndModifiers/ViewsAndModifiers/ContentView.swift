//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Adam Nguyen on 8/17/20.
//  Copyright © 2020 Adam Nguyen. All rights reserved.
//

import SwiftUI

struct LargeBlue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.blue)
    }
}

extension View {
    func largeBlue() -> some View {
        self.modifier(LargeBlue())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello world")
            .largeBlue()
            
            Text("Bottom Text")
            .largeBlue()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
