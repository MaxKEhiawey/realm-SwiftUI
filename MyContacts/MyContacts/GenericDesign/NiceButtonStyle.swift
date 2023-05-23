//
//  NiceButtonStyle.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import SwiftUI

    // Creating generic button design called NiceButtonStyle

struct NiceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(16)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .font(.headline)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut, value: 1.0)
    }
}
