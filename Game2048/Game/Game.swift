//
//  Game.swift
//  Game2048
//
//  Created by xubuntus on 29.03.2022.
//

import Foundation

struct Game {
    let rows = 4
    let columns = 4
    
    var data = [Int?]()
    
    var emptyCellCount: Int {
        rows*columns - data.compactMap{ $0 }.count
    }
    
    init() {
        self.data = [Int?](repeating: nil, count: rows*columns)
    }
}
