//
//  DefaultActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

struct DefaultActivityIndicator: View {
    @State private var isAnimating = false
    
    var body: some View {
        Replicator(
            Capsule(style: .circular)
                .offset(x: -1.5, y: -14)
                .fill(Color.activityIndicator.opacity(isAnimating ? 0.1 : 1))
                .frame(width: 3, height: 8)
        )
        .repeatCount(12)
        .repeatDelay(1.6/12)
        .repeatTransform(.rotateWithDividing(12))
        .animation(.linear(duration: 0.8)
                    .repeatForever())
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DefaultActivityIndicator()
    }
}
