//
//  CellView.swift
//  Game2048
//
//  Created by xubuntus on 30.03.2022.
//

import SwiftUI

struct CellView: View {
    let value: Int?
    let color: Color = .gray
    
    var body: some View {
        if let intValue = value {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                    .padding(5)
                Text("\(intValue)")
                    .foregroundColor(.white)
                    .font(.title)
            }
        } else {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(value: 2)
    }
}
