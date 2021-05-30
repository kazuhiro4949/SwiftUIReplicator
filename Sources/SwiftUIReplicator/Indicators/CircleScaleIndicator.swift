//
//  CircleScaleIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/24.
//  
//

import SwiftUI

public struct CircleScaleIndicator: View {
    @State private var scale: CGFloat = 1
    
    private let count: Int = 4
    private let size: CGFloat = 10
    
    public init() {}
    
    public var body: some View {
        Replicator(
            Circle()
                .fill(Color.accentColor)
                .frame(width: size, height: size)
                .scaleEffect(scale)
        )
        .repeatCount(count)
        .repeatTransform(.init(translationX: size + 5, y: 0))
        .repeatDelay(0.8/Double(count))
        .animation(.linear(duration: 0.5)
                    .delay(0.3)
                    .repeatForever())
        .onAppear(perform: {
            self.scale = 0.3
        })
        .offset(x: -22.5, y: 0)
    }
}

struct CircleInLineIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleScaleIndicator()
            .previewDevice("iPhone 12 Pro Max")
            .accentColor(.red)
    }
}
