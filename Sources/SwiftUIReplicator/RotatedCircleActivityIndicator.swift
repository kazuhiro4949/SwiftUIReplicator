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
                    width: 6,
                    height: 6
                )
                .scaleEffect(CGSize(width: isAnimating ? 1.4 : 0.8, height:  isAnimating ? 1.4: 0.8))
                .transformEffect(
                    .init(
                        translationX: -5,
                        y:  16
                    )
                )
        )
        .repeatCount(8)
        .repeatDelay(2/8)
        .repeatTransform(.rotateWithDividing(8))
        .animation(
            .linear(duration: 0.4)
                .delay(0.5)
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
