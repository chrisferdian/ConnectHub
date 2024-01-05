//
//  FloatingButtonView.swift
//  ConnectHub
//
//  Created by Indo Teknologi Utama on 05/01/24.
//

import SwiftUI

struct FloatingButtonView: View {
    
    var action: (()-> Void)?
    
    var body: some View {
        Button {
            // Action
            action?()
        } label: {
            Image(systemName: "plus")
                .font(.title.weight(.semibold))
                .padding()
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
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4)
        }
    }
}

#Preview {
    FloatingButtonView(action: nil)
}