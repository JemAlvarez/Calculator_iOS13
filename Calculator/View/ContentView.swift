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
    @ObservedObject var model = CalculatorModelView()
    
    var body: some View {
        VStack(spacing: rowColSpacing) {
            Spacer()
            
            Text("\(model.currentNum)")
                .font(.system(size: UIScreen.main.bounds.size.width * 0.1328, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, UIScreen.main.bounds.size.width / 10)
                .padding(.bottom, 20)
            
            ForEach(0..<ButtonsList.buttons.count) { i in
                HStack (spacing: self.rowColSpacing) {
                    ForEach(0..<ButtonsList.buttons[i].count) { j in
                        ButtonView(button: ButtonsList.buttons[i][j], model: self.model)
                            .onTapGesture {
                                self.functionToCall(btn: ButtonsList.buttons[i][j])
                        }
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }
    
    func functionToCall(btn: ButtonModel) {
        if btn.number != nil {
            self.model.getCurrentNum(num: "\(btn.number ?? 2)")
        } else if btn.sign == "C" {
            self.model.reset()
        } else if btn.sign != nil && btn.sign != "C" {
            self.model.getSign(sign: btn.sign!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
