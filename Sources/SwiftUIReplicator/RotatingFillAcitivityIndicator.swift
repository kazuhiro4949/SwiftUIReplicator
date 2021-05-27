//
//  RotatingFillAcitivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/26.
//  
//

import SwiftUI

struct RotatingFillAcitivityIndicator: View {
    @State private var isAnimating = false
    
    var body: some View {
        Replicator(
            Circle()
                .strokeBorder(Color.accentColor, lineWidth: 0.5)
                .background(
                    Circle()
                        .foregroundColor(isAnimating ? .accentColor : .clear)
                )
                .frame(
                    width: 10,
                    height: 10
                )
                .transformEffect(
                    .init(
                        translationX: -5,
                        y:  -25
                    )
                )
        )
        .repeatCount(8)
        .repeatDelay(0.2)
        .repeatTransform(.rotateWithDividing(8))
        .animation(
            .linear(duration: 0.2)
                .delay(1.8)
                .repeatForever(autoreverses: false)
            
        )
        .onAppear(perform: {
            withAnimation {
                self.isAnimating = true
            }
        })
    }
}

struct RotatingFillAcitivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        RotatingFillAcitivityIndicator()
    }
}
