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
                    .fill(Color.accentColor.opacity(isAnimating ? 0.1 : 1))
                    .circulate(width: 8, height: 8, ratio: 1.4)
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
            .accentColor(.gray)
    }
}
