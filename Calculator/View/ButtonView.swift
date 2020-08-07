//
//  ButtonView.swift
//  Calculator
//
//  Created by Jem Alvarez on 8/6/20.
//  Copyright © 2020 Jem Alvarez. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var button: ButtonModel
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Group {
            if button.number != nil {
                Text("\(button.number!)")
            } else if button.function != nil {
                Text(button.function!)
            } else if button.sign != nil {
                Text(button.sign!)
            } else {
                Text("N/A")
            }
        }
        .frame(width: button.number == 0 ? screenWidth / 2.47 : screenWidth / 5.5, height: button.function == nil ? screenWidth / 5.5 : screenWidth / 7.5)
        .background(button.backgroundColor.opacity(button.backgroundColorString == nil ? 0.1 : button.backgroundColorString == "Red" ? 0.2 : 1))
        .foregroundColor(button.foregroundColor)
        .cornerRadius(button.function != nil ? 20 :23)
        .font(.system(size: 25, weight: .semibold))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(button: ButtonModel(backgroundColorString: nil, number: nil, function:
            "deg", sign:
        nil))
    }
}
