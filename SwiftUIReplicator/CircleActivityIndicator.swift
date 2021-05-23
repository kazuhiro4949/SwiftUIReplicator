//
//  CircleActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

public struct CircleActivityIndicator: View {
    @State private var isAnimating = false
    
    public init() {}
    
    public var body: some View {
        withAnimation {
            Replicator(
                Circle()
                    .fill(Color.black.opacity(isAnimating ? 0.1 : 1))
                    .circulate(width: 10, height: 10)
            )
            .repeatCount(8)
            .repeatTransform(.rotateWithDividing(8))
            .repeatDelay(2/8)
            .animation(.linear(duration: 1)
                        .repeatForever())
            .onAppear(perform: {
                self.isAnimating = true
            })
        }
    }
}

struct CircleActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleActivityIndicator()
    }
}
