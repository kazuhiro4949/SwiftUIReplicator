//
//  CircleInLineIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/24.
//  
//

import SwiftUI

struct CircleInLineIndicator: View {
    @State private var isAnimating = false
    let count: Int = 4
    let size: CGFloat = 10
    
    var body: some View {
        Replicator(
            Circle()
                .fill(Color.accentColor)
                .frame(width: size, height: size)
                .scaleEffect(isAnimating ? 0.3 : 1)
        )
        .repeatCount(count)
        .repeatTransform(CGAffineTransform(translationX: size + 5, y: 0))
        .repeatDelay(0.8/Double(count))
        .animation(.linear(duration: 0.5)
                    .delay(0.3)
                    .repeatForever())
        .onAppear(perform: {
            self.isAnimating = true
        })
        .offset(x: -(size * CGFloat(count)/2), y: 0)
    }
}

struct CircleInLineIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleInLineIndicator()
            .accentColor(.red)
    }
}
