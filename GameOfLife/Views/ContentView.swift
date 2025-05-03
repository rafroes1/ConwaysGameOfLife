//
//  ContentView.swift
//  GameOfLife
//
//  Created by Rafael Carvalho on 03/05/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Conway's Game Of Life")
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            
            ConsoleView()
        }
        .background(.black)

    }
}

#Preview {
    ContentView()
}
