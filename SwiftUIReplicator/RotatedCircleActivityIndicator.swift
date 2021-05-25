//
//  RotatedCircleActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/25.
//  
//

import SwiftUI

public struct RotatedCircleActivityIndicator: View {
    @State private var isAnimating = false
    
    public init() {}
    
    public var body: some View {
        Replicator(
            Circle()
                .fill(
                    Color.accentColor
                )
                .frame(
                    width: 10,
                    height: 10
                )
                .scaleEffect(CGSize(width: isAnimating ? 1.2 : 0.5, height:  isAnimating ? 1.2: 0.5))
                .transformEffect(
                    .init(
                        translationX: -5,
                        y:  28
                    )
                )
        )
        .repeatCount(12)
        .repeatDelay(1/12)
        .repeatTransform(.rotateWithDividing(12))
        .animation(
            .linear(duration: 0.5)
                .delay(0.6)
                .repeatForever()
        )
        .onAppear(perform: {
            withAnimation {
                self.isAnimating = true
            }
        })
    }
}

struct RotatedCircleActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        RotatedCircleActivityIndicator()
    }
}
