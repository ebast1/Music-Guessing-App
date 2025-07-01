//
//  NextButtonStyle.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/1/25.
//

import SwiftUI

struct NextButtonStyle: View {
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            Text("Next Question")
                .frame(width: 300, height: 30)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
        }
    }
}

#Preview {
    NextButtonStyle(action: {})
}
