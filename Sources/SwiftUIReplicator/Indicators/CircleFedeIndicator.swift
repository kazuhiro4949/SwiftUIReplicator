//
//  CircleFedeIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/26.
//  
//

import SwiftUI

public struct CircleFedeIndicator: View {
    @State private var foregroundColor = Color.clear
    
    public init() {}
    
    public var body: some View {
        Replicator(
            Circle()
                .strokeBorder(Color.accentColor, lineWidth: 0)
                .background(
                    Circle()
                        .foregroundColor(foregroundColor)
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
                .delay(0.9)
                .repeatForever(autoreverses: false)
            
        )
        .onAppear(perform: {
            self.foregroundColor = .accentColor
        })
    }
}

struct RotatingFillAcitivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleFedeIndicator()
            .accentColor(.gray)
    }
}
