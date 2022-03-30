//
//  GameViewModel.swift
//  Game2048
//
//  Created by xubuntus on 28.03.2022.
//

import SwiftUI

class GameViewModel: ObservableObject {
    let rows = 4
    let columns = 4
    
    @Published private var game = Game()
    
    private func getRandomCell() -> Int {
        let randomPosition = Int.random(in: 0..<game.emptyCellCount)
        
        return randomPosition + game.data.prefix(randomPosition + 1).compactMap{ $0 }.count
    }
    
    private func fillOutRandomCell() -> Void {
        game.data[getRandomCell()] = 2
    }
    
    init() {
        fillOutRandomCell()
        fillOutRandomCell()
    }
    
    func transformToMatrix() -> [[Int?]] {
        var matrix: [[Int?]] = []
        for rowIndex in 1...rows {
            matrix.append(Array(game.data[((rowIndex - 1)*columns)...(rowIndex*columns - 1)]))
        }
                
        return matrix
    }
    
    
}
