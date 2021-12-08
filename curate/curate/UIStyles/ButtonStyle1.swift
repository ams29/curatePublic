//
//  buttonStyle1.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import SwiftUI

struct ButtonStyle1: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding(20)
            .foregroundColor(configuration.isPressed ? Color.blue : Color.teal)
            .background(configuration.isPressed ? Color.gray : Color.white)
            .cornerRadius(20)
    }
    
}
