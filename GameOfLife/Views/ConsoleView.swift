//
//  ConsoleView.swift
//  GameOfLife
//
//  Created by Rafael Carvalho on 03/05/25.
//

import SwiftUI

struct ConsoleView: View {
    @State var consoleText: String = ""
    
    @State var gameStarted = false

    var body: some View {
        ZStack {
            ScrollView {
                    Text(consoleText)
                        .foregroundColor(.white)
                        .font(.system(.body, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()


            }
            .background(.black)
            .padding()
            
            if !gameStarted {
                Text("Press Start to begin")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Button(action: {
                consoleText = ConwaysGOF.game.start(iterations: 10)
                gameStarted = true
            }, label: {
                Text("START")
                    .fontWeight(.bold)
            })
            .padding(.top, 16)
            .padding(.bottom, 16)
            .padding(.leading, 64)
            .padding(.trailing, 64)
            .background(.white)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .background(.black)
    }
}

#Preview {
    ConsoleView()
}
