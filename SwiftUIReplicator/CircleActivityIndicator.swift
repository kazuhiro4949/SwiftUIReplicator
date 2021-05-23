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
                    .offset(x: -5, y: 20)
                    .fill(Color.black.opacity(isAnimating ? 0.1 : 1))
                    .frame(width: 10, height: 10)
            )
            .repeatCount(8)
            .repeatTransform(CATransform3DGetAffineTransform(
                                CATransform3DMakeRotation(
                                    CGFloat((2.0*Double.pi)/Double(8)),
                                    0,
                                    0,
                                    1))
            )
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
