//
//  FloatingButtonView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

struct FloatingButtonView: View {
    
    // Closure for the action to be performed when the button is tapped.
    var action: (()-> Void)?
    
    var body: some View {
        Button {
            // Perform the action if it's provided.
            action?()
        } label: {
            Image(systemName: "plus")
                .font(.title.weight(.semibold))
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.97, green: 0.18, blue: 0.56), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.67, green: 0.1, blue: 0.94), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0, y: 0.5),
                        endPoint: UnitPoint(x: 1.03, y: 0.5)
                    )
                )
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4)
        }
    }
}

#Preview {
    FloatingButtonView(action: nil)
}
