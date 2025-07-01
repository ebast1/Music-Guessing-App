//
//  BackButtonStyle.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/1/25.
//

import SwiftUI

struct BackButtonStyle {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Exit Game")
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            .foregroundStyle(Color.red)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
        .position(x: 80, y: 35)
        
    }
}
