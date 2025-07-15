//
//  NextButtonStyle.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/1/25.
//

import SwiftUI

struct NextButtonStyle: ButtonStyle {
    var action: () -> Void = {}
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 30)
            .padding()
            .background(configuration.isPressed ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(configuration.isPressed ? Color.white : Color.blue)
    }
    
}
