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
        Replicator(
            Circle()
                .frame(width: 10, height: 10)
                .offset(x: -20, y: isAnimating ? -5 : 0)
        )
        .repeatCount(4)
        .repeatTransform(CGAffineTransform(translationX: 18, y: 0))
        .repeatDelay(0.6/4)
        .animation(.linear(duration: 0.5)
                    .repeatForever())
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}

struct CircleActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleActivityIndicator()
            .accentColor(.gray)
    }
}
