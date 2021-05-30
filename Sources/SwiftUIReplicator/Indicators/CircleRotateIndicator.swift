//
//  CircleRotateIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/25.
//  
//

import SwiftUI

/// An activity indicator with rotating circle
public struct CircleRotateIndicator: View {
    @State private var scale: CGFloat = 0.8
    
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
                .scaleEffect(CGSize(width: scale, height: scale))
                .transformEffect(
                    .init(translationX: -5, y:  16)
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
            self.scale = 1.4
        })
    }
}

struct RotatedCircleActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleRotateIndicator()
    }
}
