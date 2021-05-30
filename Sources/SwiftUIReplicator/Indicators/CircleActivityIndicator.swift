//
//  CircleActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

public struct CircleActivityIndicator: View {
    @State private var offsetY: CGFloat = 0
    
    public init() {}
    
    public var body: some View {
        Replicator(
            Circle()
                .fill(Color.accentColor)
                .frame(width: 10, height: 10)
                .offset(x: 0, y: offsetY)
        )
        .repeatCount(4)
        .repeatTransform(.init(translationX: 18, y: 0))
        .repeatDelay(0.6/4)
        .animation(.linear(duration: 0.3)
                    .delay(0.3)
                    .repeatForever())
        .onAppear(perform: {
            self.offsetY = -5
        })
        .offset(x: -26, y: 0)
    }
}

struct CircleActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircleActivityIndicator()
            .previewDevice("iPhone 12 Pro Max")
            .accentColor(.gray)
    }
}
