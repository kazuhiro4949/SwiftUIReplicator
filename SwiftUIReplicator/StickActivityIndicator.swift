//
//  StickActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/24.
//  
//

import SwiftUI

struct StickActivityIndicator: View {
    @State private var isAnimating = false
    
    var body: some View {
        Replicator(
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: 8, height: 26)
                .offset(x: -16, y: 0)
                .scaleEffect(CGSize(width: 1.0, height: isAnimating ? 1.5 : 1.0))
        )
        .repeatCount(3)
        .repeatTransform(CGAffineTransform(translationX: 12, y: 0))
        .repeatDelay(0.5/3)
        .animation(.easeInOut(duration: 0.5)
                    .delay(0.2)
                    .repeatForever())
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}

struct StickActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        StickActivityIndicator()
            .accentColor(.gray)
    }
}
