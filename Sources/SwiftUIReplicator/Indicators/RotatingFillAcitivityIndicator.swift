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
                .strokeBorder(Color.accentColor, lineWidth: 0)
                .background(
                    Circle()
                        .foregroundColor(isAnimating ? .accentColor : .clear)
                )
                .frame(
                    width: 12,
                    height: 12
                )
                .transformEffect(
                    .init(
                        translationX: -5,
                        y:  -30
                    )
                )
        )
        .repeatCount(10)
        .repeatDelay(0.1)
        .repeatTransform(.rotateWithDividing(10))
        .animation(
            .linear(duration: 1)
                .delay(1)
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
            .accentColor(.gray)
    }
}
