//
//  ContentView.swift
//  Game2048
//
//  Created by xubuntus on 28.03.2022.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
                .padding()
            VStack {
                ForEach(viewModel.transformToMatrix(), id: \.self) { row in
                    ExtractedView(row: row)
                }
            }
                .padding()
                .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                    .onEnded { value in
                            print(value.translation)
                            switch(value.translation.width, value.translation.height) {
                                case (...0, -30...30):  print("left swipe")
                                case (0..., -30...30):  print("right swipe")
                                case (-100...100, ...0):  print("up swipe")
                                case (-100...100, 0...):  print("down swipe")
                                default:  print("no clue")
                            }
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


struct ExtractedView: View {
    let row: [Int?]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { cellValue in
                CellView(value: cellValue)
            }
        }
    }
}
