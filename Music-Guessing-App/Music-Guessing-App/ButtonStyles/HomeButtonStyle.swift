//
//  HomeButtonStyle.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 6/30/25.
//

import SwiftUI

struct HomeButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 30)
            .padding()
            .clipShape(Capsule())
            .background(configuration.isPressed ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(configuration.isPressed ? Color.white : Color.blue)
    }
}
