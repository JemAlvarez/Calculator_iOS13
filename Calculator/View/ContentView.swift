//
//  ContentView.swift
//  Calculator
//
//  Created by Jem Alvarez on 8/5/20.
//  Copyright © 2020 Jem Alvarez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rowColSpacing = UIScreen.main.bounds.size.width / 25
    
    var body: some View {
        VStack(spacing: rowColSpacing) {
            Spacer()
            
            Text("123,415,678")
                .font(.system(size: UIScreen.main.bounds.size.width * 0.1328, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, UIScreen.main.bounds.size.width / 10)
                .padding(.bottom, 20)
            
            ForEach(0..<ButtonsList.buttons.count) { i in
                HStack (spacing: self.rowColSpacing) {
                    ForEach(0..<ButtonsList.buttons[i].count) { j in
                        ButtonView(button: ButtonsList.buttons[i][j])
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
